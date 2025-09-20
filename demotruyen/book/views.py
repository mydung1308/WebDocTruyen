from django.shortcuts import render
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages,auth
from django.conf import settings
from django.core.mail import EmailMessage
from django.utils import timezone
from django.urls import reverse
from .models import *
from .forms import UserForm,LoginForm ,ThemtheloaiForm,TheLoaiEditForm,TruyenForm,ChinhSuaThongTinForm # Import form mới
from django.views import generic
from django.views.generic import CreateView, DetailView, DeleteView, UpdateView, ListView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy
from django.http import HttpResponseRedirect
from django.forms import formset_factory
from django.db import transaction
from django.contrib.messages.views import SuccessMessageMixin
from django.shortcuts import get_object_or_404
from django.core.paginator import Paginator
from django.db.models import Q
from django.core.validators import validate_email
from django.core.exceptions import ValidationError
from datetime import datetime, timedelta
from django.db.models.signals import post_save
from django.dispatch import receiver


# 4.1 GIAO DIỆN CHUNG 
#@login_required
def Home(request):
    truyens = Truyen.objects.all().order_by('-ngay_cap_nhat')
    theloais = TheLoai.objects.all()

    # Truy vấn các truyện được nhiều người "thích" nhất
    top_truyen_thich = Truyen.objects.annotate(so_luot_thich=Count('truyen_luot_thich')).order_by('-so_luot_thich')[:4] # SELECT t.*, COUNT(tt.id) AS so_luot_thich    FROM truyen t    LEFT JOIN thichtruyen tt   ON t.id = tt.id_truyen_id     GROUP BY t.id     ORDER BY so_luot_thich DESC     LIMIT 4;    

    top_truyen_yeu_thich = Truyen.objects.annotate(so_luot_yeu_thich=Count('truyen_yeu_thich_list')).order_by('-so_luot_yeu_thich')[:4]   # SELECT t.*, COUNT(tyt.id) AS so_luot_yeu_thich    FROM truyen t    LEFT JOIN truyenyeuthich tyt ON t.id = tyt.id_truyen_id    GROUP BY t.id     ORDER BY so_luot_yeu_thich DESC     LIMIT 4; 
    
    paginator = Paginator(truyens, 4)  # Hiển thị 8 truyện mỗi trang
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'giaodienchung/index.html', {'page_obj': page_obj,'theloais': theloais, 'top_truyen_thich': top_truyen_thich, 'top_truyen_yeu_thich': top_truyen_yeu_thich})




def chi_tiet_truyen(request, truyen_id):
    # Lấy thông tin truyện theo ID
    truyen = get_object_or_404(Truyen, id=truyen_id)

    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database

    # Lấy danh sách chương theo thứ tự giảm dần (mới nhất trước)
    danh_sach_chuong = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by('-thu_tu')

     # Lấy thông tin tác giả từ bảng TacGia
    tac_gia = TacGia.objects.get(id_nguoi_dung=truyen.id_tac_gia.id_nguoi_dung)

    # Lấy danh sách thể loại của truyện
    the_loai_cua_truyen = TheLoaiTruyen.objects.filter(id_truyen=truyen).select_related('id_the_loai')

    #Truyện tương tự
    truyen_tuong_tu = Truyen.objects.filter(the_loai_cua_truyen__id_the_loai__in=the_loai_cua_truyen.values_list('id_the_loai', flat=True)).exclude(id=truyen.id).distinct()[:5]

    cac_binhluan = DanhgiaTruyen.objects.filter(id_truyen=truyen, parent__isnull=True).select_related('user').prefetch_related('phan_hoi').order_by('-thoigian_danhgia')

    tong_binhluan = DanhgiaTruyen.objects.filter(id_truyen=truyen).exclude(binhluan__isnull=True).exclude(binhluan='').count()



    # Render template với dữ liệu truyện và danh sách chương
    return render(request, 'giaodienchung/chitiettruyen.html', {
        'truyen': truyen,
        'danh_sach_chuong': danh_sach_chuong,
        'tac_gia': tac_gia,
        'theloais': theloais,
        'the_loai_cua_truyen': [tl.id_the_loai for tl in the_loai_cua_truyen], # Lấy danh sách thể loại của truyện
        'truyen_tuong_tu': truyen_tuong_tu,  # Truyền danh sách truyện tương tự vào context
        'cac_binhluan': cac_binhluan,  # Truyền danh sách bình luận vào context
        'tong_binhluan': tong_binhluan,  # Truyền tổng số bình luận vào context


    })


# Hàm lấy địa chỉ IP từ request
def get_client_ip(request):     # Đây là định nghĩa của hàm get_client_ip, nhận một tham số request, là đối tượng HttpRequest trong Django. Đối tượng này chứa thông tin về yêu cầu HTTP mà người dùng gửi đến server.
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')       # request.META là một từ điển chứa tất cả các thông tin về yêu cầu HTTP, bao gồm các header.
                                                                     # get('HTTP_X_FORWARDED_FOR') là một cách để lấy giá trị của header X-Forwarded-For, nếu có. Header này thường được sử dụng trong các cấu hình proxy hoặc load balancer để chỉ ra địa chỉ IP của client thực sự. Nếu có nhiều proxy, địa chỉ IP của client sẽ được liệt kê trong header này, cách nhau bằng dấu phẩy.

    if x_forwarded_for:     # Kiểm tra xem biến x_forwarded_for có giá trị hay không. Nếu có, điều này có nghĩa là yêu cầu đã đi qua một hoặc nhiều proxy.
        ip = x_forwarded_for.split(',')[0]      # Nếu x_forwarded_for có giá trị, hàm sẽ tách chuỗi này bằng dấu phẩy và lấy địa chỉ IP đầu tiên (địa chỉ IP của client thực sự). Điều này là cần thiết vì có thể có nhiều địa chỉ IP trong header này (mỗi proxy sẽ thêm địa chỉ IP của client vào danh sách).
    else:
        ip = request.META.get('REMOTE_ADDR')    # Nếu không có giá trị cho x_forwarded_for, điều này có nghĩa là yêu cầu không đi qua proxy, và bạn có thể lấy địa chỉ IP trực tiếp từ REMOTE_ADDR.
    return ip      # Cuối cùng, hàm trả về địa chỉ IP mà nó đã lấy được, có thể là từ X-Forwarded-For hoặc từ REMOTE_ADDR.



def doc_chuong(request, truyen_id, thu_tu):
    truyen = get_object_or_404(Truyen, id=truyen_id)
    chuong = get_object_or_404(ThongTinChuongTruyen, id_truyen=truyen, thu_tu=thu_tu)
    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database

    # Lấy chương trước và chương sau
    chuong_truoc = ThongTinChuongTruyen.objects.filter(id_truyen=truyen, thu_tu=thu_tu - 1).first()
    chuong_sau = ThongTinChuongTruyen.objects.filter(id_truyen=truyen, thu_tu=thu_tu + 1).first()

    # Lấy danh sách tất cả chương để hiển thị dropdown
    danh_sach_chuong = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by('thu_tu')

    #chuong_ip = get_object_or_404(ThongTinChuongTruyen, thu_tu=thu_tu, id_truyen=truyen)  # Lấy thông tin chương theo ID
    truyen_ip = chuong.id_truyen  # Lấy truyện từ chương

    # SELECT id_truyen
    # FROM ThongTinChuongTruyen
    # WHERE thu_tu = <thu_tu> AND id_truyen = <truyen_id>;

    ip = get_client_ip(request)                       # Hàm get_client_ip(request) được gọi để lấy địa chỉ IP của client từ đối tượng request. Địa chỉ IP này sẽ được sử dụng để kiểm tra xem client đã xem truyện này trong khoảng thời gian gần đây hay chưa.

    # Kiểm tra xem IP này đã xem truyện này trong 1 giờ gần nhất chưa

    mot_gio_truoc = timezone.now() - timedelta(hours=1)          
    #mot_gio_truoc = datetime.now() - timedelta(hours=1)

    # Kiểm tra nếu đã có lượt xem gần đây bởi IP hoặc user
    da_xem = Luotxem.objects.filter(
        id_truyen=truyen,
        thoigian_xem__gte=mot_gio_truoc
    ).filter(
        models.Q(ip_address=ip) | models.Q(user=request.user if request.user.is_authenticated else None) #Sử dụng Q() để viết điều kiện OR, vì mặc định filter(a, b) là AND.
    ).exists()
    #Đây là điều kiện OR (hoặc), dùng để kiểm tra: Người này đã xem bằng IP này, hoặc, Người đã đăng nhập (request.user) đã xem

    # SELECT EXISTS (
    # SELECT 1
    # FROM Luotxem
    # WHERE id_truyen = <truyen_id>
    # AND thoigian_xem >= <mot_gio_truoc>
    #AND (ip_address = '<ip_address>' OR user_id = <user_id>)
# );


    #da_xem = Luotxem.objects.filter(
        #id_truyen=truyen_ip,
        #ip_address=ip,
        #thoigian_xem__gte=mot_gio_truoc
    #).exists()

    if not da_xem:
        Luotxem.objects.create(          # INSERT INTO Luotxem (id_truyen, user_id, ip_address)
            id_truyen=truyen_ip,         # VALUES (<truyen_ip>, <user_id>, '<ip_address>');
            user=request.user if request.user.is_authenticated else None,
            ip_address=ip
        )
        truyen_ip.luot_xem += 1                         # UPDATE Truyen  
        truyen_ip.save(update_fields=['luot_xem'])      # SET luot_xem = luot_xem + 1 
                                                        # WHERE id = <truyen_ip>;
                                                        # Để làm rõ, luot_xem không phải là một trường trong model Truyen, mà là một khái niệm để chỉ số lượt xem của truyện, được quản lý thông qua model Luotxem. 


    context = {
        'truyen': truyen,
        'chuong': chuong,
        'chuong_truoc': chuong_truoc,
        'chuong_sau': chuong_sau,
        'danh_sach_chuong': danh_sach_chuong , # Thêm danh sách chương vào context
        'theloais': theloais,
        'truyen_ip': truyen_ip,  # Truyền thông tin truyện vào context
         
    }
    return render(request, 'giaodienchung/doc_chuong.html', context)



@login_required
def doc_tu_first(request, truyen_id):
    truyen = get_object_or_404(Truyen, id=truyen_id)
    chuong_dau = truyen.chuong_truyen.order_by('thu_tu').first()

    if chuong_dau:
        return redirect('doc_chuong', truyen_id=truyen.id, thu_tu=chuong_dau.thu_tu)
    else:
        return redirect('chitiettruyen', truyen_id=truyen.id)  # hoặc thông báo chưa có chương




@login_required
def doc_tap_new(request, truyen_id):
    truyen = get_object_or_404(Truyen, id=truyen_id)
    chuong_moi = truyen.chuong_truyen.order_by('-thu_tu').first()

    if chuong_moi:
        return redirect('doc_chuong', truyen_id=truyen.id, thu_tu=chuong_moi.thu_tu)
    else:
        return redirect('chitiettruyen', truyen_id=truyen.id)




def tim_kiem_truyen(request):
    query = request.GET.get('q', '').strip()  # Lấy nội dung tìm kiếm từ request
    so_chuong = request.GET.get('so_chuong', '')
    trang_thai = request.GET.get('trang_thai', '')
    the_loai_id = request.GET.getlist('the_loai')  # Lấy danh sách thể loại đã chọn
    #the_loai = request.GET.getlist('the_loai')  # Lấy danh sách thể loại (checkbox)
    #the_loai_list = TheLoai.objects.all()
    sap_xep = request.GET.get('sap_xep', 'newest')  # Mặc định sắp xếp theo ngày mới nhất
    #sap_xep = request.GET.get('sap_xep', '-ngay_cap_nhat')  # Sắp xếp mặc định là ngày cập nhật mới nhất

    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database
    
    if not query:  # Kiểm tra nếu không có từ khóa tìm kiếm
        ket_qua = Truyen.objects.all()  # Hiển thị tất cả truyện nếu không nhập từ khóa
     
    else:
        ket_qua = Truyen.objects.all()
    # Lọc theo từ khóa tìm kiếm (nếu có)
    if query:
        ket_qua = ket_qua.filter(
            Q(ten_truyen__icontains=query) | Q(tom_tat_noi_dung__icontains=query)
        )
     # Lọc theo số chương
    so_chuong = request.GET.get('so_chuong')  
    if so_chuong:
        if '-' in so_chuong:  # Kiểm tra nếu là khoảng (VD: "11-50")
            min_chap, max_chap = map(int, so_chuong.split('-'))
        ket_qua = ket_qua.filter(so_luong_chuong__gte=min_chap, so_luong_chuong__lte=max_chap)

    # Lọc theo trạng thái
    if trang_thai:
        ket_qua = ket_qua.filter(trang_thai=trang_thai)

    # Chuyển danh sách ID thể loại thành số nguyên
    the_loai_id = [int(tl) for tl in the_loai_id if tl.isdigit()]

    # Lọc theo thể loại (nếu có chọn)
    if the_loai_id:
        ket_qua = ket_qua.filter(the_loai_cua_truyen__id_the_loai__id__in=the_loai_id).distinct()

    # Lọc theo thể loại (nếu chọn nhiều thể loại)
    #the_loai_selected = request.GET.getlist('the_loai')
    #if the_loai_selected:
        #ket_qua = ket_qua.filter(the_loai__id_truyen__ten_the_loai__in=the_loai).distinct()

    # Sắp xếp kết quả
    sap_xep = request.GET.get('sap_xep', 'newest')
    if sap_xep == "newest":
        ket_qua = ket_qua.order_by('-ngay_cap_nhat')
    else:
        ket_qua = ket_qua.order_by('ngay_cap_nhat')

    # Sắp xếp theo lựa chọn
    #ket_qua = ket_qua.order_by(sap_xep)

   
   
    #ket_qua = Truyen.objects.filter(Q(ten_truyen__icontains=query) | Q(tom_tat_noi_dung__icontains=query))
    tong_so_ket_qua = ket_qua.count()

    return render(request, 'giaodienchung/tim_kiem.html', {
        'ket_qua': ket_qua,
        'tong_so_ket_qua': tong_so_ket_qua,
        'query': query,
        'the_loai_id': list(map(int, the_loai_id)),  # Chuyển thành danh sách số nguyên
        'so_chuong': so_chuong,
        'trang_thai': trang_thai,
        'sap_xep': sap_xep,
        'ds_the_loai': TheLoai.objects.all(),  # Danh sách thể loại cho giao diện
        'theloais': theloais
    })



def Theloai(request,pk):
    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại
    theloai = get_object_or_404(TheLoai, pk=pk)
    # Lấy danh sách truyện theo thể loại
    danh_sach_truyen = Truyen.objects.filter(the_loai_cua_truyen__id_the_loai=theloai).order_by('-ngay_cap_nhat')
    paginator = Paginator(danh_sach_truyen, 1)  # Hiển thị 8 truyện mỗi trang
    page_number = request.GET.get('page')  # Lấy số trang từ URL (?page=1, ?page=2)
    page_obj = paginator.get_page(page_number)

    # Lấy danh sách chương theo thứ tự giảm dần (mới nhất trước)
    #danh_sach_chuong = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by('-thu_tu')
    #truyens = TheLoai.objects.all()  # Lấy danh sách thể loại từ database
    return render(request, 'giaodienchung/the_loai.html', {'theloai': theloai,'theloais': theloais, 'page_obj': page_obj})
    


def RegisterView(request):

    if request.method == "POST":
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')

        user_data_has_error = False

        if User.objects.filter(username=username).exists():
            user_data_has_error = True
            messages.error(request, "Username already exists")

        if User.objects.filter(email=email).exists():
            user_data_has_error = True
            messages.error(request, "Email already exists")

        if len(password) < 5:
            user_data_has_error = True
            messages.error(request, "Password must be at least 5 characters")

        if user_data_has_error:
            return redirect('register')
        else:
            new_user = User.objects.create_user(
                first_name=first_name,
                last_name=last_name,
                email=email, 
                username=username,
                password=password
            )
             # Tạo bản ghi ThongTinNguoiDung với các trường cần thiết
            try:
                ThongTinNguoiDung.objects.create(
                    user=new_user,
                    ten_hien_thi=f"{first_name} {last_name}",  # Hoặc có thể lấy từ username
                    # Các trường khác có thể lấy giá trị mặc định hoặc bỏ trống
                )
            except Exception as e:
                messages.warning(request, "User  created, but failed to create user information.")
                # Có thể ghi log lỗi ở đây nếu cần

            #ThongTinNguoiDung.objects.create( user=new_user)
            messages.success(request, "Account created. Login now")
            return redirect('login')

    return render(request, 'giaodienchung/register.html')




def LoginView(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)

            if user.is_superuser:  # Nếu là admin
                return redirect('admin-home')
            else:  # Nếu là người dùng bình thường
                return redirect('reader-home')
        
        else:
            messages.error(request, "Invalid login credentials")
            return redirect('login')

    return render(request, 'giaodienchung/login.html')


# LOGOUT 
def LogoutView(request):

    logout(request)

    return redirect('home')



def ForgotPassword(request):

    if request.method == "POST":
        email = request.POST.get('email')

        try:
            user = User.objects.get(email=email)

            new_password_reset = PasswordReset(user=user)
            new_password_reset.save()

            password_reset_url = reverse('reset-password', kwargs={'reset_id': new_password_reset.reset_id})

            full_password_reset_url = f'{request.scheme}://{request.get_host()}{password_reset_url}'

            email_body = f'Reset your password using the link below:\n\n\n{full_password_reset_url}'
        
            email_message = EmailMessage(
                'Reset your password', # email subject
                email_body,
                settings.EMAIL_HOST_USER, # email sender
                [email] # email  receiver 
            )

            email_message.fail_silently = True
            email_message.send()

            return redirect('password-reset-sent', reset_id=new_password_reset.reset_id)

        except User.DoesNotExist:
            messages.error(request, f"No user with email '{email}' found")
            return redirect('forgot-password')

    return render(request, 'giaodienchung/forgot_password.html')


def PasswordResetSent(request, reset_id):

    if PasswordReset.objects.filter(reset_id=reset_id).exists():
        return render(request, 'giaodienchung/password_reset_sent.html')
    else:
        # redirect to forgot password page if code does not exist
        messages.error(request, 'Invalid reset id')
        return redirect('forgot-password')



def ResetPassword(request, reset_id):

    try:
        password_reset_id = PasswordReset.objects.get(reset_id=reset_id)

        if request.method == "POST":
            password = request.POST.get('password')
            confirm_password = request.POST.get('confirm_password')

            passwords_have_error = False

            if password != confirm_password:
                passwords_have_error = True
                messages.error(request, 'Passwords do not match')

            if len(password) < 5:
                passwords_have_error = True
                messages.error(request, 'Password must be at least 5 characters long')

            expiration_time = password_reset_id.created_when + timezone.timedelta(minutes=10)

            if timezone.now() > expiration_time:
                passwords_have_error = True
                messages.error(request, 'Reset link has expired')

                password_reset_id.delete()

            if not passwords_have_error:
                user = password_reset_id.user
                user.set_password(password)
                user.save()

                password_reset_id.delete()

                messages.success(request, 'Password reset. Proceed to login')
                return redirect('login')
            else:
                # redirect back to password reset page and display errors
                return redirect('reset-password', reset_id=reset_id)

    
    except PasswordReset.DoesNotExist:
        
        # redirect to forgot password page if code does not exist
        messages.error(request, 'Invalid reset id')
        return redirect('forgot-password')

    return render(request, 'giaodienchung/reset_password.html')


#def truyen_moi_cap_nhat(request):
    #truyens = Truyen.objects.all().order_by('-ngay_cap_nhat')

    #paginator = Paginator(truyens, 3)  # Hiển thị 8 truyện mỗi trang
    #page_number = request.GET.get('page')
    #page_obj = paginator.get_page(page_number)

    #return render(request, 'giaodienchung/index.html', {'page_obj': page_obj})



                                             # TRANG ADMIN
@login_required
def AdminHome(request):
    truyen = Truyen.objects.all().count()
    user = User.objects.all().count()
    truyens = Truyen.objects.all().order_by('-ngay_cap_nhat')
    
    
    paginator = Paginator(truyens, 4)  # Hiển thị 8 truyện mỗi trang
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {'page_obj':page_obj, 'truyen':truyen, 'user':user}

    return render(request, 'admin/home.html', context)


@login_required
def chi_tiet_truyen1(request, truyen_id):
    # Lấy thông tin truyện theo ID
    truyen = get_object_or_404(Truyen, id=truyen_id)

    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database

    # Lấy danh sách chương theo thứ tự giảm dần (mới nhất trước)
    danh_sach_chuong = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by('-thu_tu')

     # Lấy thông tin tác giả từ bảng TacGia
    tac_gia = TacGia.objects.get(id_nguoi_dung=truyen.id_tac_gia.id_nguoi_dung)

    # Lấy danh sách thể loại của truyện
    the_loai_cua_truyen = TheLoaiTruyen.objects.filter(id_truyen=truyen).select_related('id_the_loai')



    # Render template với dữ liệu truyện và danh sách chương
    return render(request, 'admin/chitiettruyen1.html', {
        'truyen': truyen,
        'danh_sach_chuong': danh_sach_chuong,
        'tac_gia': tac_gia,
        'theloais': theloais,
        'the_loai_cua_truyen': [tl.id_the_loai for tl in the_loai_cua_truyen]  # Lấy danh sách thể loại của truyện
    })



@login_required
def doc_chuong1(request, truyen_id, thu_tu):
    truyen = get_object_or_404(Truyen, id=truyen_id)
    chuong = get_object_or_404(ThongTinChuongTruyen, id_truyen=truyen, thu_tu=thu_tu)
    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database

    # Lấy chương trước và chương sau
    chuong_truoc = ThongTinChuongTruyen.objects.filter(id_truyen=truyen, thu_tu=thu_tu - 1).first()
    chuong_sau = ThongTinChuongTruyen.objects.filter(id_truyen=truyen, thu_tu=thu_tu + 1).first()

    # Lấy danh sách tất cả chương để hiển thị dropdown
    danh_sach_chuong = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by('thu_tu')

    context = {
        'truyen': truyen,
        'chuong': chuong,
        'chuong_truoc': chuong_truoc,
        'chuong_sau': chuong_sau,
        'danh_sach_chuong': danh_sach_chuong , # Thêm danh sách chương vào context
        'theloais': theloais
    }
    return render(request, 'admin/doc_chuong1.html', context)




@login_required
def Theloai1(request,pk):
    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại
    theloai = get_object_or_404(TheLoai, pk=pk)
    # Lấy danh sách truyện theo thể loại
    danh_sach_truyen = Truyen.objects.filter(the_loai_cua_truyen__id_the_loai=theloai).order_by('-ngay_cap_nhat')
    paginator = Paginator(danh_sach_truyen, 4)  # Hiển thị 8 truyện mỗi trang
    page_number = request.GET.get('page')  # Lấy số trang từ URL (?page=1, ?page=2)
    page_obj = paginator.get_page(page_number)

    # Lấy danh sách chương theo thứ tự giảm dần (mới nhất trước)
    #danh_sach_chuong = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by('-thu_tu')
    #truyens = TheLoai.objects.all()  # Lấy danh sách thể loại từ database
    return render(request, 'admin/the_loai1.html', {'theloai': theloai,'theloais': theloais, 'page_obj': page_obj})
    
#cách 1
#@login_required
#def ListUserView(request):
    #users = User.objects.all()
    #return render(request, 'admin/list_users.html', {'users': users})
#cách 2

class ListUserView(LoginRequiredMixin, ListView): #Trong views.py, class ListUserView phải có paginate_by, và Django tự động thêm page_obj vào context: page_obj là một object chứa thông tin về trang hiện tại, số trang, trang trước, trang sau, v.v.
    model = User
    template_name = 'admin/list_users.html'
    context_object_name = 'users'
    paginate_by = 1

    def get_queryset(self):
        return User.objects.order_by('-id')


@login_required    
def Quanlytheloai(request):
    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database
    return render(request, 'admin/quanlytheloai.html', {'theloais': theloais})



@login_required(login_url='/login/')  # Bắt buộc phải đăng nhập mới được thêm thể loại CHUA THANH CONG
def Themtheloai(request):
    if request.method == 'POST':
        #theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database
        ten_the_loai = request.POST.get('ten_the_loai', '').strip()  # Lấy giá trị an toàn hơn
        #theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database

        if not ten_the_loai:  # Kiểm tra nếu người dùng để trống
            messages.error(request, 'Tên thể loại không được để trống.')
            return render(request, 'admin/quanlytheloai.html' )

        # Kiểm tra xem thể loại đã tồn tại chưa
        if TheLoai.objects.filter(ten_the_loai__iexact=ten_the_loai).exists():
            messages.error(request, 'Thể loại này đã tồn tại.')
            return render(request, 'admin/quanlytheloai.html')

        # Nếu không trùng, tiến hành lưu vào database
        TheLoai.objects.create(ten_the_loai=ten_the_loai)
        messages.success(request, 'Thể loại đã được thêm thành công!')
        return redirect('qltheloai')  # Điều hướng về trang thêm thể loại
         # Lấy danh sách thể loại từ database
        

    return render(request, 'admin/quanlytheloai.html')  # Trả về template quản lý thể loại


#class Themtheloai(CreateView):
    #model = TheLoai
    #form_class = ThemtheloaiForm
    #template_name = 'quanlytheloai.html'
    #success_url = '/qltheloai/'

#def Danhsachtheloai(request):
    #ds_theloai = TheLoai.objects.all()
    #return render(request, 'admin/quanlytheloai.html', {'ds_theloai': ds_theloai})

#class TheLoaiListView(generic.ListView):

    #model = TheLoai
    #template_name = 'admin/quanlytheloai.html'
    #context_object_name = 'ds_theloai'
    #paginate_by = 10 # Hiển thị 20 thể loại trên mỗi trang

    #def get_queryset(self):
        #return TheLoai.objects.order_by('id')
    #def get_context_data(self, **kwargs):
        #context = super().get_context_data(**kwargs)
        #context['time'] = timezone.now()
        #return context
    
#class TheLoaiListViewe(LoginRequiredMixin,DetailView):
    #model = TheLoai
    #template_name = 'admin/quanlytheloai.html'
    #context_object_name = 'theloais'
    #paginate_by = 20

   # def get_queryset(self):
        #return User.objects.order_by('-id')




#class TheLoaiEditView(LoginRequiredMixin,UpdateView): #thông báo chưa nhập và trùng tên thì bằng tiếng anh cần override lại 
	#model = TheLoai             # Nhap model   #=> UpdateView tự nó biết có trùng hay ko và bắt buộc nhậpnhập
	#form_class = TheLoaiEditForm     # Nhap form
	#template_name = 'admin/suatheloai.html ' # Nhap template
	#success_url = reverse_lazy('qltheloai') # Nhap url trang sẽ trở về sau khi update
	#success_message = 'Tên thể loại đã được cập nhật thành công' # Nhap message
    
#def form_valid(self, form):
        #messages.success(self.request, "Tên thể loại đã được cập nhật thành công!")
        #return super().form_valid(form)

#def form_invalid(self, form):
        #messages.error(self.request, "Có lỗi xảy ra, vui lòng kiểm tra lại!")
        #return super().form_invalid(form)

        
@login_required
def sua_the_loai(request, pk):
    theloai = get_object_or_404(TheLoai, pk=pk)

    if request.method == 'POST':
        ten_moi = request.POST.get('ten_the_loai', '').strip()

        if not ten_moi:
            messages.error(request, 'Tên thể loại không được để trống.')
        elif TheLoai.objects.exclude(pk=pk).filter(ten_the_loai__iexact=ten_moi).exists():
            messages.error(request, f'Thể loại "{ten_moi}" đã tồn tại.')
        else:
            theloai.ten_the_loai = ten_moi
            theloai.save()
            messages.success(request, f'Sửa thể loại thành công: "{ten_moi}".')
            return redirect('qltheloai')  # Trang danh sách thể loại

    return render(request, 'admin/suatheloai.html', {'theloai': theloai})




@login_required
def xoa_the_loai(request, pk): 
    theloai = get_object_or_404(TheLoai, pk=pk)

    ten = theloai.ten_the_loai  # Lưu lại tên trước khi xóa

    theloai.delete()

    messages.success(request, f'Đã xóa thể loại "{ten}" thành công.')
    return redirect('qltheloai')  # Đường dẫn tên URL bạn đã đặt


#class TheLoaiDeleteView(LoginRequiredMixin,DeleteView): # chưa hiển thị được thông báobáo
	#model =  TheLoai    # Nhap model
	#template_name = 'admin/quanlytheloai.html' # Nhap template
	#success_url = reverse_lazy('qltheloai') # Nhap url
	#success_message = 'Thể loại đã được xóa thành công' # Nhap message
#def delete(self, request, *args, **kwargs):
        #messages.success(request, "Thể loại đã được xóa thành công!")
        #return super().delete(request, *args, **kwargs)

#def delete(self, request, *args, **kwargs):
        
        #self.object = self.get_object()
        #messages.success(request, f"Thể loại '{self.object.ten_the_loai}' đã được xóa thành công!")
        #self.object.delete()
        #return HttpResponseRedirect(self.success_url) 



@login_required
def Quanlytruyen(request):
    # Lấy danh sách truyện và tối ưu hóa truy vấn để tránh N+1 Query
    truyens = Truyen.objects.select_related('id_tac_gia').prefetch_related('the_loai_cua_truyen__id_the_loai').order_by('-id')

    # Phân trang (mỗi trang hiển thị 10 truyện)
    paginator = Paginator(truyens, 5)  # 10 truyện mỗi trang
    page_number = request.GET.get('page')  # Lấy số trang từ URL (?page=1, ?page=2)
    truyen_page = paginator.get_page(page_number)  # Lấy trang hiện tại
    truyen = Truyen.objects.all().count()
    user = User.objects.all().count()

    context = {'truyen_page': truyen_page, 'truyen':truyen, 'user':user}  # Truyền danh sách truyện vào context
    return render(request, 'admin/quanlytruyen.html', context)



@login_required
def dang_ky_truyen(request):
    the_loais = TheLoai.objects.all()  # Lấy danh sách thể loại

    if request.method == "POST":
        ten_truyen = request.POST.get("ten_truyen")
        anh_dai_dien = request.FILES.get("anh_dai_dien")
        the_loai_ids = request.POST.getlist("the_loai")  # Lấy the loai tu bang THE LOAI thong qua ban TheLoaiTruyen ,TheLoaiTruyen cx lien ket vs TRUYEN qa PK
        trang_thai = request.POST.get("trang_thai")
        gioi_thieu = request.POST.get("gioi_thieu")
        so_chuong = int(request.POST.get("so_chuong", 0))

        # Kiểm tra trùng tên truyện
        if Truyen.objects.filter(ten_truyen=ten_truyen).exists():
            messages.error(request, "Tên truyện đã tồn tại, vui lòng nhập tên khác.")
            return redirect("dang_ky_truyen")

        # Tạo truyện mới
        truyen = Truyen.objects.create(
            id_tac_gia=request.user.thong_tin_nguoi_dung.tac_gia,
            ten_truyen=ten_truyen,
            anh_dai_dien=anh_dai_dien,
            tom_tat_noi_dung=gioi_thieu,
            trang_thai=trang_thai,
            so_luong_chuong=so_chuong,
        )

        # Thêm thể loại vào bảng TheLoaiTruyen
        if the_loai_ids:
            for the_loai_id in the_loai_ids:
                the_loai = TheLoai.objects.get(id=the_loai_id)
                TheLoaiTruyen.objects.create(id_truyen=truyen, id_the_loai=the_loai)


        # Thêm chương truyện
        for i in range(1, so_chuong + 1):
            ten_chuong = request.POST.get(f"ten_chuong_{i}")
            noi_dung_chuong = request.POST.get(f"noi_dung_chuong_{i}")
            
            if ten_chuong and noi_dung_chuong:
                ThongTinChuongTruyen.objects.create(
                    id_truyen=truyen,
                    ten_chuong=ten_chuong,
                    noi_dung_chuong=noi_dung_chuong,
                    thu_tu=i
            )

        messages.success(request, "Đăng ký truyện thành công!")
        return redirect("qltruyen")

    return render(request, "admin/dang_ky_truyen.html", {"the_loais": the_loais})




@login_required
def tim_kiem_truyen1(request):
    query = request.GET.get('q', '').strip()  # Lấy nội dung tìm kiếm từ request
    so_chuong = request.GET.get('so_chuong', '')
    trang_thai = request.GET.get('trang_thai', '')
    the_loai_id = request.GET.getlist('the_loai')  # Lấy danh sách thể loại đã chọn
    #the_loai = request.GET.getlist('the_loai')  # Lấy danh sách thể loại (checkbox)
    #the_loai_list = TheLoai.objects.all()
    sap_xep = request.GET.get('sap_xep', 'newest')  # Mặc định sắp xếp theo ngày mới nhất
    #sap_xep = request.GET.get('sap_xep', '-ngay_cap_nhat')  # Sắp xếp mặc định là ngày cập nhật mới nhất

    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database
    
    if not query:  # Kiểm tra nếu không có từ khóa tìm kiếm
        ket_qua = Truyen.objects.all()  # Hiển thị tất cả truyện nếu không nhập từ khóa
     
    else:
        ket_qua = Truyen.objects.all()
    # Lọc theo từ khóa tìm kiếm (nếu có)
    if query:
        ket_qua = ket_qua.filter(
            Q(ten_truyen__icontains=query) | Q(tom_tat_noi_dung__icontains=query)
        )
     # Lọc theo số chương
    so_chuong = request.GET.get('so_chuong')  
    if so_chuong:
        if '-' in so_chuong:  # Kiểm tra nếu là khoảng (VD: "11-50")
            min_chap, max_chap = map(int, so_chuong.split('-'))
        ket_qua = ket_qua.filter(so_luong_chuong__gte=min_chap, so_luong_chuong__lte=max_chap)

    # Lọc theo trạng thái
    if trang_thai:
        ket_qua = ket_qua.filter(trang_thai=trang_thai)

    # Chuyển danh sách ID thể loại thành số nguyên
    the_loai_id = [int(tl) for tl in the_loai_id if tl.isdigit()]

    # Lọc theo thể loại (nếu có chọn)
    if the_loai_id:
        ket_qua = ket_qua.filter(the_loai_cua_truyen__id_the_loai__id__in=the_loai_id).distinct()

    # Lọc theo thể loại (nếu chọn nhiều thể loại)
    #the_loai_selected = request.GET.getlist('the_loai')
    #if the_loai_selected:
        #ket_qua = ket_qua.filter(the_loai__id_truyen__ten_the_loai__in=the_loai).distinct()

    # Sắp xếp kết quả
    sap_xep = request.GET.get('sap_xep', 'newest')
    if sap_xep == "newest":
        ket_qua = ket_qua.order_by('-ngay_cap_nhat')
    else:
        ket_qua = ket_qua.order_by('ngay_cap_nhat')

    # Sắp xếp theo lựa chọn
    #ket_qua = ket_qua.order_by(sap_xep)

   
   
    #ket_qua = Truyen.objects.filter(Q(ten_truyen__icontains=query) | Q(tom_tat_noi_dung__icontains=query))
    tong_so_ket_qua = ket_qua.count()

    return render(request, 'admin/tim_kiem1.html', {
        'ket_qua': ket_qua,
        'tong_so_ket_qua': tong_so_ket_qua,
        'query': query,
        'the_loai_id': list(map(int, the_loai_id)),  # Chuyển thành danh sách số nguyên
        'so_chuong': so_chuong,
        'trang_thai': trang_thai,
        'sap_xep': sap_xep,
        'ds_the_loai': TheLoai.objects.all(),  # Danh sách thể loại cho giao diện
        'theloais': theloais
    })



def Theloai(request,pk):
    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại
    theloai = get_object_or_404(TheLoai, pk=pk)
    # Lấy danh sách truyện theo thể loại
    danh_sach_truyen = Truyen.objects.filter(the_loai_cua_truyen__id_the_loai=theloai).order_by('-ngay_cap_nhat')
    paginator = Paginator(danh_sach_truyen, 4)  # Hiển thị 8 truyện mỗi trang
    page_number = request.GET.get('page')  # Lấy số trang từ URL (?page=1, ?page=2)
    page_obj = paginator.get_page(page_number)

    # Lấy danh sách chương theo thứ tự giảm dần (mới nhất trước)
    #danh_sach_chuong = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by('-thu_tu')
    #truyens = TheLoai.objects.all()  # Lấy danh sách thể loại từ database
    return render(request, 'giaodienchung/the_loai.html', {'theloai': theloai,'theloais': theloais, 'page_obj': page_obj})
    




@login_required
def chinh_sua_truyen(request, truyen_id):
    truyen = get_object_or_404(Truyen, id=truyen_id, id_tac_gia=request.user.thong_tin_nguoi_dung.tac_gia)
    the_loai_da_chon = truyen.the_loai_cua_truyen.values_list('id_the_loai', flat=True)
    the_loai = TheLoai.objects.all()
    chuongs = truyen.chuong_truyen.all().order_by('thu_tu')

    if request.method == "POST":
        ten_truyen = request.POST.get("ten_truyen")
        anh_dai_dien = request.FILES.get("anh_dai_dien")
        the_loai_ids = request.POST.getlist("the_loai")
        trang_thai = request.POST.get("trang_thai")
        gioi_thieu = request.POST.get("gioi_thieu")
        so_chuong_hien_tai = truyen.so_luong_chuong # Số chương hiện tại
        so_chuong_moi = int(request.POST.get("so_chuong_moi", 0)) # Số chương mới

        # Kiểm tra trùng tên truyện
        if Truyen.objects.exclude(id=truyen.id).filter(ten_truyen=ten_truyen).exists():
            messages.error(request, "Tên truyện đã tồn tại, vui lòng nhập tên khác.")
            return redirect("chinh_sua_truyen", truyen_id=truyen.id)

        # Cập nhật thông tin truyện
        truyen.ten_truyen = ten_truyen
        truyen.tom_tat_noi_dung = gioi_thieu
        truyen.trang_thai = trang_thai
        if anh_dai_dien:
            truyen.anh_dai_dien = anh_dai_dien
        truyen.save()

        # Cập nhật thể loại
        truyen.the_loai_cua_truyen.all().delete()
        for the_loai_id in the_loai_ids:
            TheLoaiTruyen.objects.create(id_truyen=truyen, id_the_loai_id=the_loai_id)

        # Cập nhật các chương cũ
        for chuong in chuongs:
            ten_chuong = request.POST.get(f"ten_chuong_{chuong.id}")
            noi_dung_chuong = request.POST.get(f"noi_dung_chuong_{chuong.id}")

            if ten_chuong and noi_dung_chuong:
                chuong.ten_chuong = ten_chuong
                chuong.noi_dung_chuong = noi_dung_chuong
                chuong.save()

        # Thêm chương mới nếu có
        if so_chuong_moi > 0:
            for i in range(1, so_chuong_moi + 1):
                ten_chuong_moi = request.POST.get(f"ten_chuong_moi_{i}")
                noi_dung_chuong_moi = request.POST.get(f"noi_dung_chuong_moi_{i}")

                if ten_chuong_moi and noi_dung_chuong_moi:
                    ThongTinChuongTruyen.objects.create(
                        id_truyen=truyen,
                        ten_chuong=ten_chuong_moi,
                        noi_dung_chuong=noi_dung_chuong_moi,
                        thu_tu=so_chuong_hien_tai + i # Số thứ tự chương mới
                    )
        
        # Xử lý xóa chương
        chuong_xoa_ids = request.POST.get("chuong_xoa", "").strip(",")  # Lấy danh sách ID chương cần xóa
        if chuong_xoa_ids:
            chuong_xoa_list = chuong_xoa_ids.split(",")  # Chuyển thành danh sách
            ThongTinChuongTruyen.objects.filter(id__in=chuong_xoa_list).delete()  # Xóa chương trong DB

        # Cập nhật lại số thứ tự chương sau khi xóa
        chuongs_con_lai = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by("thu_tu")
        for index, chuong in enumerate(chuongs_con_lai, start=1):
            chuong.thu_tu = index
            chuong.save()

        # Cập nhật số chương của truyện
        truyen.so_luong_chuong = chuongs_con_lai.count()
        truyen.save()

            # Cập nhật lại số lượng chương
        #truyen.so_luong_chuong += so_chuong_moi
        #truyen.save()

        messages.success(request, "Chỉnh sửa truyện thành công!")
        return redirect("qltruyen")

    context = {
        "truyen": truyen,
        "the_loai": the_loai,
        "the_loai_da_chon": the_loai_da_chon,
        "chuongs": chuongs,
    }
    return render(request, "admin/chinh_sua_truyen.html", context)




# Xoá truyện
@login_required
def xoa_truyen(request, pk):
    truyens = get_object_or_404(Truyen, pk=pk)
    #truyens = Truyen.objects.get(pk=pk)
    truyens.delete()
    messages.success(request, "Truyện đã được xóa thành công!")
    return redirect('qltruyen')




                                     # TRANG READER

@login_required
def ReaderHome(request):
    truyens = Truyen.objects.all().order_by('-ngay_cap_nhat')
    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database

    top_truyen_thich = Truyen.objects.annotate(so_luot_thich=Count('truyen_luot_thich')).order_by('-so_luot_thich')[:4]

    top_truyen_yeu_thich = Truyen.objects.annotate(so_luot_yeu_thich=Count('truyen_yeu_thich_list')).order_by('-so_luot_yeu_thich')[:4] 

    paginator = Paginator(truyens, 4)  # Hiển thị 8 truyện mỗi trang
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
   
    #thong_tin = request.user.thong_tin_nguoi_dung  # Lấy thông tin từ model ThongTinNguoiDung
    return render(request, 'reader/home.html', {'page_obj': page_obj, 'theloais': theloais, 'top_truyen_thich': top_truyen_thich, 'top_truyen_yeu_thich': top_truyen_yeu_thich})



# TRANG ĐỌC TRUYỆN
@login_required
def chi_tiet_truyen2(request, truyen_id):
    # Lấy thông tin truyện theo ID
    truyen = get_object_or_404(Truyen, id=truyen_id)

    # Lấy danh sách chương theo thứ tự giảm dần (mới nhất trước)
    danh_sach_chuong = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by('-thu_tu')

     # Lấy thông tin tác giả từ bảng TacGia
    tac_gia = TacGia.objects.get(id_nguoi_dung=truyen.id_tac_gia.id_nguoi_dung)


    # Lấy danh sách thể loại 
    theloais = TheLoai.objects.all()
   

    da_thich = False # Mặc định là False, user chưa thích truyện
    if request.user.is_authenticated:
        da_thich = ThichTruyen.objects.filter(user=request.user, id_truyen=truyen).exists() # Nếu có ít nhất một bản ghi thỏa mãn điều kiện này, phương thức .exists() sẽ trả về True, và biến da_thich sẽ được gán giá trị True.



    #cac_binhluan = DanhgiaTruyen.objects.filter(id_truyen=truyen, binhluan__isnull=False).exclude(binhluan='').order_by('-thoigian_danhgia') # Hàm chi_tiet_truyen2: Hàm này có thể được sử dụng để hiển thị chi tiết của một truyện, bao gồm cả các bình luận đã có. Do đó, bạn cần lấy tất cả các bình luận hợp lệ để hiển thị cho người dùng.



    reader= ThongTinNguoiDung.objects.get(user=request.user) # Lấy thông tin người dùng hiện tại
    theo_doi = False # Mặc định là False, user chưa thích truyện
    if request.user.is_authenticated:
        theo_doi = TruyenYeuThich.objects.filter(id_nguoi_dung=reader, id_truyen=truyen).exists() # Nếu có ít nhất một bản ghi thỏa mãn điều kiện này, phương thức .exists() sẽ trả về True, và biến da_thich sẽ được gán giá trị True.

   
   # Lấy danh sách thể loại của truyện
    the_loai_cua_truyen = TheLoaiTruyen.objects.filter(id_truyen=truyen).select_related('id_the_loai')    # SELECT tl.id, tl.ten_the_loai    FROM theloai tl     JOIN theloaitruyen tt ON tl.id = tt.id_the_loai_id    WHERE tt.id_truyen_id = <ID_TRUYEN>;   

   #Truyện tương tự
    truyen_tuong_tu = Truyen.objects.filter(the_loai_cua_truyen__id_the_loai__in=the_loai_cua_truyen.values_list('id_the_loai', flat=True)).exclude(id=truyen.id).distinct()[:5]    # Giả sử truyen.id = 123 | SELECT DISTINCT t.*    FROM truyen t    JOIN theloaitruyen tl ON t.id = tl.id_truyen_id    WHERE tl.id_the_loai_id IN( SELECT id_the_loai_id    FROM theloaitruyen   WHERE id_truyen_id = 123)  AND t.id <> 123    LIMIT 5;   |  
    # the_loai_cua_truyen__id_the_loai__in=...→ Lọc các truyện có ít nhất một thể loại nằm trong danh sách thể loại của truyen hiện tại.                                                                                                                                                                                                                                 

    #cac_binhluan = DanhgiaTruyen.objects.filter(id_truyen=truyen, binhluan__isnull=False).select_related('user').prefetch_related('phan_hoi').order_by('-thoigian_danhgia')
    cac_binhluan = DanhgiaTruyen.objects.filter(id_truyen=truyen, parent__isnull=True).select_related('user').prefetch_related('phan_hoi').order_by('-thoigian_danhgia')


    #cac_binhluan = DanhgiaTruyen.objects.filter(id_truyen=truyen,binhluan__isnull=False).exclude(binhluan='').select_related('user').prefetch_related('phan_hoi').order_by('-thoigian_danhgia')

# SELECT dg.*
# FROM danhgiatruyen dg
# JOIN auth_user u ON dg.user_id = u.id
# WHERE dg.id_truyen_id = <ID_TRUYEN>
  # AND dg.parent_id IS NULL
# ORDER BY dg.thoigian_danhgia DESC;


    tong_binhluan = DanhgiaTruyen.objects.filter(id_truyen=truyen).exclude(binhluan__isnull=True).exclude(binhluan='').count()


    # Render template với dữ liệu truyện và danh sách chương
    return render(request, 'reader/chitiettruyen2.html', {
        'truyen': truyen,
        'danh_sach_chuong': danh_sach_chuong,
        'tac_gia': tac_gia,
        'theloais': theloais,
        'truyen': truyen,
        'da_thich': da_thich,
        'cac_binhluan': cac_binhluan,
        'theo_doi': theo_doi,
        'reader': reader,
        'the_loai_cua_truyen': the_loai_cua_truyen,
        'truyen_tuong_tu': truyen_tuong_tu,
        'tong_binhluan': tong_binhluan,
        

    })

    #return render(request, 'reader/home.html')



@login_required
def doc_chuong2(request, truyen_id, thu_tu):
    truyen = get_object_or_404(Truyen, id=truyen_id)

    chuong = get_object_or_404(ThongTinChuongTruyen, id_truyen=truyen, thu_tu=thu_tu)

    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database

    # Lấy chương trước và chương sau
    chuong_truoc = ThongTinChuongTruyen.objects.filter(id_truyen=truyen, thu_tu=thu_tu - 1).first()
    chuong_sau = ThongTinChuongTruyen.objects.filter(id_truyen=truyen, thu_tu=thu_tu + 1).first()

    # Lấy danh sách tất cả chương để hiển thị dropdown
    danh_sach_chuong = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by('thu_tu')

    chuong_dadoc = Chuongdadoc.objects.filter(user=request.user, chuong=chuong).first()  # Kiểm tra xem người dùng đã đọc chương này chưa
    
    truyen_ip = chuong.id_truyen  # Lấy truyện từ chương

    ip = get_client_ip(request)                       # Hàm get_client_ip(request) được gọi để lấy địa chỉ IP của client từ đối tượng request. Địa chỉ IP này sẽ được sử dụng để kiểm tra xem client đã xem truyện này trong khoảng thời gian gần đây hay chưa.

    # Kiểm tra xem IP này đã xem truyện này trong 1 giờ gần nhất chưa

    mot_gio_truoc = timezone.now() - timedelta(hours=1)          
    #mot_gio_truoc = datetime.now() - timedelta(hours=1)

    # Kiểm tra nếu đã có lượt xem gần đây bởi IP hoặc user
    da_xem = Luotxem.objects.filter(
        id_truyen=truyen,
        thoigian_xem__gte=mot_gio_truoc
    ).filter(
        models.Q(ip_address=ip) | models.Q(user=request.user if request.user.is_authenticated else None) #Sử dụng Q() để viết điều kiện OR, vì mặc định filter(a, b) là AND.
    ).exists()
    #Đây là điều kiện OR (hoặc), dùng để kiểm tra: Người này đã xem bằng IP này, hoặc, Người đã đăng nhập (request.user) đã xem

    if not da_xem:
        Luotxem.objects.create(          # INSERT INTO Luotxem (id_truyen, user_id, ip_address)
            id_truyen=truyen_ip,         # VALUES (<truyen_ip>, <user_id>, '<ip_address>');
            user=request.user if request.user.is_authenticated else None,
            ip_address=ip
        )
        truyen_ip.luot_xem += 1                         # UPDATE Truyen  
        truyen_ip.save(update_fields=['luot_xem'])

    context = {
        'truyen': truyen,
        'chuong': chuong,
        'chuong_truoc': chuong_truoc,
        'chuong_sau': chuong_sau,
        'danh_sach_chuong': danh_sach_chuong,  # Thêm danh sách chương vào context
        'theloais': theloais,
        'chuong_dadoc': chuong_dadoc,
        'truyen_ip': truyen_ip,  # Truyền thông tin truyện để cập nhật lượt xem 
    }
    return render(request, 'reader/doc_chuong2.html', context)



@login_required
def tim_kiem_truyen2(request):
    query = request.GET.get('q', '').strip()  # Lấy nội dung tìm kiếm từ request
    so_chuong = request.GET.get('so_chuong', '')
    trang_thai = request.GET.get('trang_thai', '')
    the_loai_id = request.GET.getlist('the_loai')  # Lấy danh sách thể loại đã chọn
    #the_loai = request.GET.getlist('the_loai')  # Lấy danh sách thể loại (checkbox)
    #the_loai_list = TheLoai.objects.all()
    sap_xep = request.GET.get('sap_xep', 'newest')  # Mặc định sắp xếp theo ngày mới nhất
    #sap_xep = request.GET.get('sap_xep', '-ngay_cap_nhat')  # Sắp xếp mặc định là ngày cập nhật mới nhất

    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database
    
    if not query:  # Kiểm tra nếu không có từ khóa tìm kiếm
        ket_qua = Truyen.objects.all()  # Hiển thị tất cả truyện nếu không nhập từ khóa
     
    else:
        ket_qua = Truyen.objects.all()
    # Lọc theo từ khóa tìm kiếm (nếu có)
    if query:
        ket_qua = ket_qua.filter(
            Q(ten_truyen__icontains=query) | Q(tom_tat_noi_dung__icontains=query)
        )
     # Lọc theo số chương
    so_chuong = request.GET.get('so_chuong')  
    if so_chuong:
        if '-' in so_chuong:  # Kiểm tra nếu là khoảng (VD: "11-50")
            min_chap, max_chap = map(int, so_chuong.split('-'))
        ket_qua = ket_qua.filter(so_luong_chuong__gte=min_chap, so_luong_chuong__lte=max_chap)

    # Lọc theo trạng thái
    if trang_thai:
        ket_qua = ket_qua.filter(trang_thai=trang_thai)

    # Chuyển danh sách ID thể loại thành số nguyên
    the_loai_id = [int(tl) for tl in the_loai_id if tl.isdigit()]

    # Lọc theo thể loại (nếu có chọn)
    if the_loai_id:
        ket_qua = ket_qua.filter(the_loai_cua_truyen__id_the_loai__id__in=the_loai_id).distinct()

    # Lọc theo thể loại (nếu chọn nhiều thể loại)
    #the_loai_selected = request.GET.getlist('the_loai')
    #if the_loai_selected:
        #ket_qua = ket_qua.filter(the_loai__id_truyen__ten_the_loai__in=the_loai).distinct()

    # Sắp xếp kết quả
    sap_xep = request.GET.get('sap_xep', 'newest')
    if sap_xep == "newest":
        ket_qua = ket_qua.order_by('-ngay_cap_nhat')
    else:
        ket_qua = ket_qua.order_by('ngay_cap_nhat')

    # Sắp xếp theo lựa chọn
    #ket_qua = ket_qua.order_by(sap_xep)

   
   
    #ket_qua = Truyen.objects.filter(Q(ten_truyen__icontains=query) | Q(tom_tat_noi_dung__icontains=query))
    tong_so_ket_qua = ket_qua.count()

    return render(request, 'reader/tim_kiem2.html', {
        'ket_qua': ket_qua,
        'tong_so_ket_qua': tong_so_ket_qua,
        'query': query,
        'the_loai_id': list(map(int, the_loai_id)),  # Chuyển thành danh sách số nguyên
        'so_chuong': so_chuong,
        'trang_thai': trang_thai,
        'sap_xep': sap_xep,
        'ds_the_loai': TheLoai.objects.all(),  # Danh sách thể loại cho giao diện
        'theloais': theloais
    })


@login_required
def Theloai2(request,pk):
    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại
    theloai = get_object_or_404(TheLoai, pk=pk)
    # Lấy danh sách truyện theo thể loại
    danh_sach_truyen = Truyen.objects.filter(the_loai_cua_truyen__id_the_loai=theloai).order_by('-ngay_cap_nhat')
    paginator = Paginator(danh_sach_truyen, 4)  # Hiển thị 8 truyện mỗi trang
    page_number = request.GET.get('page')  # Lấy số trang từ URL (?page=1, ?page=2)
    page_obj = paginator.get_page(page_number)


    # Lấy danh sách chương theo thứ tự giảm dần (mới nhất trước)
    #danh_sach_chuong = ThongTinChuongTruyen.objects.filter(id_truyen=truyen).order_by('-thu_tu')
    #truyens = TheLoai.objects.all()  # Lấy danh sách thể loại từ database
    return render(request, 'reader/the_loai2.html', {'theloai': theloai,'theloais': theloais, 'page_obj': page_obj})




@login_required
def thong_tin_ca_nhan(request):
    nguoi_dung = request.user  
    thong_tin = nguoi_dung.thong_tin_nguoi_dung  # Lấy thông tin từ model ThongTinNguoiDung
    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại

    return render(request, 'reader/thongtin.html', {
        'nguoi_dung': nguoi_dung,
        'thong_tin': thong_tin,
        'theloais': theloais
    })


#@login_required
#def Home(request):
    #truyens = Truyen.objects.all().order_by('-ngay_cap_nhat')

    #paginator = Paginator(truyens, 4)  # Hiển thị 8 truyện mỗi trang
    #page_number = request.GET.get('page')
    #page_obj = paginator.get_page(page_number)
    #return render(request, 'giaodienchung/index.html', {'page_obj': page_obj})


@login_required
def edit_user_info(request):
    user = request.user
    thong_tin = ThongTinNguoiDung.objects.get(user=user)

    if request.method == "POST":
        form = ChinhSuaThongTinForm(request.POST, request.FILES, instance=user)
        if form.is_valid():
            form.save()
            thong_tin.ten_hien_thi = form.cleaned_data['ten_hien_thi']
            thong_tin.gioi_tinh = form.cleaned_data['gioi_tinh']
            if 'anh_dai_dien' in request.FILES:
                thong_tin.anh_dai_dien = request.FILES['anh_dai_dien']
            thong_tin.save()
            messages.success(request, "Cập nhật thông tin thành công!")
            return redirect('reader-thongtincanhan')
    else:
        form = ChinhSuaThongTinForm(instance=user, initial={
            'ten_hien_thi': thong_tin.ten_hien_thi,
            'gioi_tinh': thong_tin.gioi_tinh,
        })

    return render(request, 'reader/chinh_sua_thong_tin.html', {'form': form})




@login_required
def chinh_sua_thong_tin(request):
    user = request.user
    thong_tin = ThongTinNguoiDung.objects.get(user=user)
    theloais = TheLoai.objects.all()  # Lấy danh sách thể loại từ database

    if request.method == "POST":
        username = request.POST.get('username').strip()
        first_name = request.POST.get('first_name').strip()
        last_name = request.POST.get('last_name').strip()
        ten_hien_thi = request.POST.get('ten_hien_thi').strip()
        email = request.POST.get('email').strip()
        gioi_tinh = request.POST.get('gioi_tinh')
        anh_dai_dien = request.FILES.get('anh_dai_dien')

        # Kiểm tra bắt buộc nhập
        if not first_name or not last_name or not ten_hien_thi:
            messages.error(request, "Họ, tên, và tên hiển thị không được để trống!")
            return redirect('reader-sua-thongtincanhan')

        # Kiểm tra username trùng
        if User.objects.exclude(pk=user.pk).filter(username=username).exists():
            messages.error(request, "Tên đăng nhập đã tồn tại!")
            return redirect('reader-sua-thongtincanhan')

        # Kiểm tra email hợp lệ
        try:
            validate_email(email)
        except ValidationError:
            messages.error(request, "Email không hợp lệ!")
            return redirect('reader-sua-thongtincanhan')

        # Cập nhật thông tin người dùng
        user.username = username
        user.first_name = first_name
        user.last_name = last_name
        user.email = email
        user.save()

        # Cập nhật thông tin chi tiết
        thong_tin.ten_hien_thi = ten_hien_thi
        thong_tin.gioi_tinh = gioi_tinh
        if anh_dai_dien:
            thong_tin.anh_dai_dien = anh_dai_dien
        thong_tin.save()

        messages.success(request, "Cập nhật thông tin thành công!")
        return redirect('reader-thongtincanhan')

    return render(request, 'reader/chinh_sua_thong_tin.html', {'user': user, 'thong_tin': thong_tin,'theloais': theloais})




@login_required
def toggle_thich_truyen(request, truyen_id):
    if not request.user.is_authenticated: # Nếu người dùng chưa đăng nhập (is_authenticated trả về False), hàm sẽ chuyển hướng người dùng đến trang đăng nhập.
        return redirect('login')  # hoặc redirect về trang khác

    truyen = get_object_or_404(Truyen, id=truyen_id)
    thich, created = ThichTruyen.objects.get_or_create(user=request.user, id_truyen=truyen) #Dòng này sử dụng phương thức get_or_create để tìm một bản ghi trong bảng ThichTruyen
    # Nếu tìm thấy bản ghi, biến thich sẽ chứa bản ghi đó và created sẽ là False. Nếu không tìm thấy, một bản ghi mới sẽ được tạo và created sẽ là True.


    if not created: # Nếu created là False, điều này có nghĩa là người dùng đã thích truyện này trước đó.
        thich.delete()  # nếu đã tồn tại thì xóa (bỏ thích)

    # DELETE FROM Thich
    # WHERE id = <thich_id>;
    return redirect('reader-chitiettruyen', truyen_id=truyen.id) # Hàm sẽ chuyển hướng người dùng trở lại trang chi tiết của truyện (truyen_detail) với truyen_id của truyện đó. 




@login_required
def binhluan_truyen(request, truyen_id):
    truyen = get_object_or_404(Truyen, pk=truyen_id)
    cac_binhluan = DanhgiaTruyen.objects.filter(id_truyen=truyen,binhluan__isnull=False).exclude(binhluan__exact='').order_by('-thoigian_danhgia') # Sửa lại như sau để chỉ lấy các bình luận có nội dung:
    #cac_binhluan = DanhgiaTruyen.objects.filter(id_truyen=truyen).exclude(binhluan__isnull=False).exclude(binhluan__exact='').order_by('-thoigian_danhgia') #Câu lệnh này sẽ trả về một danh sách các bình luận cho một truyện cụ thể, loại bỏ các bình luận không có nội dung (cả NULL và chuỗi rỗng), và sắp xếp chúng theo thời gian bình luận từ mới đến cũ.

    # Hàm binhluan_truyen: Hàm này có thể được sử dụng để xử lý việc người dùng gửi bình luận mới cho một truyện. Do đó, bạn có thể không cần lấy tất cả các bình luận hiện có ngay lập tức, mà chỉ cần xử lý bình luận mới mà người dùng gửi lên.
    #thongtin=ThongTinNguoiDung.objects.get(user=request.user)  # Lấy thông tin người dùng hiện tại

    if request.method == 'POST': 
        binhluan = request.POST.get('binhluan', '').strip()   #Lấy giá trị của trường bình luận từ dữ liệu POST.,    Nếu trường bình luận không có giá trị (người dùng không nhập gì), nó sẽ trả về một chuỗi rỗng.,   Loại bỏ các khoảng trắng ở đầu và cuối chuỗi bình luận.

        if not binhluan:  # Kiểm tra nếu người dùng để trống 
            messages.error(request, "Bạn chưa nhập bình luận!") 
            

        if binhluan:
            #Dùng create() nếu cho phép người dùng bình luận nhiều lần.
            DanhgiaTruyen.objects.create(           # INSERT INTO DanhgiaTruyen (id_truyen, user_id, danhgia, binhluan, thoigian_danhgia) VALUES (<truyen_id>, <user_id>, 0, '<binhluan>', NOW());
                id_truyen=truyen,
                user=request.user,
                danhgia=0,                                    
                binhluan= binhluan,    
                thoigian_danhgia= timezone.now()
                
            )

        return redirect('reader-chitiettruyen', truyen_id=truyen.id)

    return render(request, 'reader/chitiettruyen2.html', {    # Hàm render trong Django được sử dụng để tạo ra một phản hồi HTTP bằng cách kết hợp một template (mẫu) với một ngữ cảnh (context).,Khi bạn gọi render, Django sẽ tìm kiếm template được chỉ định, sau đó kết hợp nó với dữ liệu từ ngữ cảnh để tạo ra nội dung HTML mà người dùng sẽ thấy.
        'truyen': truyen,
        'cac_binhluan': cac_binhluan,
        
    })


# update_or_create: Hàm này sẽ cập nhật bình luận nếu đã tồn tại, hoặc tạo mới nếu chưa có bình luận nào từ người dùng đó cho truyện đó.
# Câu lệnh này là một phần quan trọng trong quy trình xử lý yêu cầu HTTP trong Django, cho phép bạn tạo ra nội dung ĐỘNG dựa trên dữ liệu từ cơ sở dữ liệu và hiển thị nó cho người dùng.
# SELECT *                                                                  UPDATE DanhgiaTruyen
# FROM DanhgiaTruyen                                                        SET binhluan = '<binhluan>', capnhat = NOW()
# WHERE id_truyen = <truyen_id> AND user_id = <user_id> AND danhgia = 0;    WHERE id_truyen = <truyen_id> AND user_id = <user_id> AND danhgia = 0;

@login_required
def reply_danhgia(request, truyen_id):
    if request.method == 'POST':
        noidung = request.POST.get('binhluan', '').strip()
        parent_id = request.POST.get('parent_id')
        
        truyen = get_object_or_404(Truyen, id=truyen_id)

        if not noidung:
            messages.error(request, "Bạn chưa nhập nội dung bình luận.")
            return redirect('reader-chitiettruyen', truyen_id=truyen_id)

        try:
            parent = DanhgiaTruyen.objects.get(id=parent_id, id_truyen=truyen)
        except DanhgiaTruyen.DoesNotExist:
            messages.error(request, "Bình luận cha không tồn tại.")
            return redirect('reader-chitiettruyen', truyen_id=truyen_id)

        DanhgiaTruyen.objects.create(
            id_truyen=truyen,
            user=request.user,
            danhgia=0,
            binhluan=noidung,
            parent=parent
        )

    return redirect('reader-chitiettruyen', truyen_id=truyen_id) # mục đích của hàm này là xử lý một yêu cầu POST để gửi phản hồi cho một bình luận, và sau đó chuyển hướng người dùng trở lại trang chi tiết truyện.
                                                                            # Trong trường hợp này, không cần phải render một template mới vì mục đích của hàm là xử lý dữ liệu và chuyển hướng người dùng.

@login_required
def sua_binh_luan(request, id):
    binhluan = get_object_or_404(DanhgiaTruyen, id=id, user=request.user)

    if request.method == 'POST':
        noi_dung_moi = request.POST.get('noi_dung_moi', '').strip()
        if noi_dung_moi:
            binhluan.binhluan = noi_dung_moi
            binhluan.save()
    return redirect('reader-chitiettruyen', truyen_id=binhluan.id_truyen.id)




@login_required
def xoa_binhluan(request, binhluan_id):
    binhluan = get_object_or_404(DanhgiaTruyen, id=binhluan_id, user=request.user)
    binhluan.binhluan = ''
    binhluan.save()
    return redirect('reader-chitiettruyen', truyen_id=binhluan.id_truyen.id)



@login_required
def doc_tu_dau(request, truyen_id): # là một tham số đầu vào của hàm, dùng để xác định truyện nào cần được xử lý.
    truyen = get_object_or_404(Truyen, id=truyen_id)
    chuong_dau = truyen.chuong_truyen.order_by('thu_tu').first() # chuong_dau = ThongTinChuongTruyen.objects.filter(chuong_truyen=truyen).order_by('thu_tu).first  CẢ 2 ĐỀU ĐÚNG 

    if chuong_dau:
        return redirect('reader-docchuong', truyen_id=truyen.id, thu_tu=chuong_dau.thu_tu)  #thu_tu là một giá trị được lấy từ đối tượng chuong_dau sau khi đã xác định chương đầu tiên của truyện. Nó được sử dụng để chuyển hướng đến chương đó trong URL.
    else:
        return redirect('reader-chitiettruyen', truyen_id=truyen.id)  # hoặc thông báo chưa có chương




@login_required
def doc_tap_moi(request, truyen_id):
    truyen = get_object_or_404(Truyen, id=truyen_id)
    chuong_moi = truyen.chuong_truyen.order_by('-thu_tu').first()

    if chuong_moi:
        return redirect('reader-docchuong', truyen_id=truyen.id, thu_tu=chuong_moi.thu_tu)
    else:
        return redirect('reader-chitiettruyen', truyen_id=truyen.id)




@login_required
def toggle_theo_doi_truyen(request, truyen_id):
    reader= ThongTinNguoiDung.objects.get(user=request.user) # Lấy thông tin người dùng hiện tại
    if not request.user.is_authenticated: # Nếu người dùng chưa đăng nhập (is_authenticated trả về False), hàm sẽ chuyển hướng người dùng đến trang đăng nhập.
        return redirect('login')  # hoặc redirect về trang khác

    truyen = get_object_or_404(Truyen, id=truyen_id)
    theodoi, created = TruyenYeuThich.objects.get_or_create(id_nguoi_dung=reader, id_truyen=truyen) #Dòng này sử dụng phương thức get_or_create để tìm một bản ghi trong bảng ThichTruyen
    # Nếu tìm thấy bản ghi, biến thich sẽ chứa bản ghi đó và created sẽ là False. Nếu không tìm thấy, một bản ghi mới sẽ được tạo và created sẽ là True.


    if not created: # created = False , not created = true đã thích  | Nếu created là TRUE , điều này có nghĩa là người dùng đã theo dõi  truyện này trước đó.
        theodoi.delete()  # nếu đã tồn tại thì xóa (bỏ theo dõi)

    return redirect('reader-chitiettruyen', truyen_id=truyen.id) # Hàm sẽ chuyển hướng người dùng trở lại trang chi tiết của truyện với truyen_id của truyện đó. 




@receiver(post_save, sender=ThongTinChuongTruyen) # điều này có nghĩa là hàm sẽ được gọi mỗi khi một đối tượng ThongTinChuongTruyen mới được lưu vào cơ sở dữ liệu.
def thong_bao_chuong_moi(sender, instance, created, **kwargs):
    if created:                         #  Nếu created là True, điều đó có nghĩa là một chương mới đã được thêm vào.
        truyen = instance.id_truyen                        # lấy đối tượng truyện liên quan đến chương mới được tạo.
        danh_sach_yeu_thich = TruyenYeuThich.objects.filter(id_truyen=truyen).select_related('id_nguoi_dung')      # chứa danh sách tất cả người dùng đã thích truyện này. Sử dụng

        for yt in danh_sach_yeu_thich:
            # Giả sử bạn có hệ thống gửi email hoặc push riêng
            print(f"[THÔNG BÁO] Gửi đến {yt.id_nguoi_dung.user.username}: Truyện '{truyen.ten_truyen}' có chương mới: {instance.ten_chuong}")


from django.utils.html import format_html


def trang_ca_nhan(request):
    thong_tin = request.user.thong_tin_nguoi_dung
    theloais= TheLoai.objects.all()  # Lấy danh sách thể loại từ database
    truyen_theo_doi = TruyenYeuThich.objects.filter(id_nguoi_dung=thong_tin)

    chuong_moi_theo_truyen = {}

    for item in truyen_theo_doi:
        truyen = item.id_truyen

        # Tìm chương cuối cùng mà người dùng đã đọc cho truyện hiện tại. Nếu không có chương nào được đọc, hàm sẽ bỏ qua truyện này.
        chuong_cuoi_doc = Chuongdadoc.objects.filter(
        user=request.user,
        chuong__id_truyen=truyen
        ).order_by('-chuong__thu_tu').first()

        # Nếu chưa từng đọc chương nào → bỏ qua truyện này
        if not chuong_cuoi_doc:
            continue  # bỏ qua truyện chưa đọc
                                                        
        thu_tu_cuoi = chuong_cuoi_doc.chuong.thu_tu      # Lưu trữ thứ tự của chương cuối cùng đã đọc.  SELECT tc.thu_tu   FROM chuongdadoc cd   JOIN thong_tin_chuong_truyen tc ON cd.chuong_id = tc.id   WHERE cd.user_id = <user_id>   ORDER BY tc.thu_tu DESC   LIMIT 1;

        cac_chuong_moi = truyen.chuong_truyen.filter(thu_tu__gt=thu_tu_cuoi).order_by('thu_tu')      # SELECT tc.*, t.ten_truyen    FROM thong_tin_chuong_truyen tc     JOIN truyen t ON tc.id_truyen = t.id    WHERE tc.id_truyen = <truyen_id> AND tc.thu_tu > <thu_tu_cuoi>   ORDER BY tc.thu_tu;

        if cac_chuong_moi.exists():
            chuong_moi_theo_truyen[truyen] = cac_chuong_moi

    return render(request, 'reader/truyen_theo_doi.html', {
        'truyen_theo_doi': truyen_theo_doi,
        'chuong_moi_theo_truyen': chuong_moi_theo_truyen,
        'theloais': theloais,  # Truyền danh sách thể loại vào context

    })




@login_required
def danh_dau_da_doc(request, chuong_id):
    chuong = get_object_or_404(ThongTinChuongTruyen, id=chuong_id)
    user = request.user

    # Xóa chương đã đọc cũ của truyện này (nếu có)   
    Chuongdadoc.objects.filter(user=user, chuong__id_truyen=chuong.id_truyen).delete()  # DELETE FROM chuongdadoc WHERE user_id = <user_id> AND chuong_id IN ( SELECT id FROM thongtinchuongtruyen WHERE id_truyen = <truyen_id>);

    # Lưu chương mới
    Chuongdadoc.objects.create(user=user, chuong=chuong)

    return redirect(chuong.get_absolute_url())  # chuyển lại trang chương đang đọc





from django.db.models import OuterRef, Subquery, Count, IntegerField, Max, F
from django.db.models.functions import Coalesce


# @login_required: dùng cho view (request vào), để bảo vệ trang yêu cầu đăng nhập.
# get_truyen_theo_doi: chỉ là hàm tiện ích (helper), không cần @login_required, vì request.user đã được xác thực ở hàm view.

def get_truyen_theo_doi(user):
    thongtin_nguoidung = ThongTinNguoiDung.objects.get(user=user)     # Lấy thông tin chi tiết của người dùng từ bảng ThongTinNguoiDung dựa trên đối tượng user

    so_chuong_dadoc_sub = (
        Chuongdadoc.objects
        .filter(user=user, chuong__id_truyen=OuterRef('id_truyen'))         # OuterRef('id_truyen') cho phép tham chiếu đến trường id_truyen trong truy vấn chính.
        .values('chuong__id_truyen')
        .annotate(total=Count('id'))                # Đếm số lượng chương đã đọc cho mỗi truyện và gán cho trường total.
        .values('total')[:1]
    )
    # SELECT COUNT(id) AS total    FROM Chuongdadoc    WHERE user_id = <user_id> AND chuong_id_truyen = (SELECT id_truyen FROM Truyen WHERE id = <id_truyen>)    GROUP BY chuong_id_truyen     LIMIT 1;

    chuong_moi_nhat_sub = (                                            # SELECT chuong_thu_tu    FROM Chuongdadoc     WHERE user_id = <user_id> AND chuong_id_truyen = (SELECT id_truyen FROM Truyen WHERE id = <id_truyen>)     ORDER BY chuong_thu_tu DESC     LIMIT 1;
        Chuongdadoc.objects
        .filter(user=user, chuong__id_truyen=OuterRef('id_truyen'))
        .order_by('-chuong__thu_tu')
        .values('chuong__thu_tu')[:1]
    )

    return (
        TruyenYeuThich.objects
        .filter(id_nguoi_dung=thongtin_nguoidung)
        .select_related('id_truyen')
        .annotate(
            truyen_id_custom=F('id_truyen__id'),  # Gán đúng tên
            ten_truyen=F('id_truyen__ten_truyen'),
            tong_so_chuong=F('id_truyen__so_luong_chuong'),
            so_chuong_dadoc=Coalesce(Subquery(so_chuong_dadoc_sub, output_field=IntegerField()), 0),
            chuong_moi_nhat=Subquery(chuong_moi_nhat_sub)
        )
        .order_by('-chuong_moi_nhat')
    )

@login_required
def truyen_dang_theo_doi(request):
    truyen_theo_doi = get_truyen_theo_doi(request.user)  # Lấy thông tin người dùng từ request.user.thongtinnguoidung
    theloais= TheLoai.objects.all() 
    return render(request, 'reader/theo_doi.html', {
        'truyen_theo_doi': truyen_theo_doi,
        'theloais': theloais  # Truyền danh sách thể loại vào context
    })




@login_required
def truyen_da_doc(request):
    if request.user.is_authenticated:
        # Lấy tất cả các chương đã đọc của người dùng
        chuong_da_doc = Chuongdadoc.objects.filter(user=request.user)
        # Tạo một dictionary để lưu trữ thông tin truyện và số chương đã đọc
        truyen_da_doc = {}
        for chuong in chuong_da_doc:
            truyen = chuong.chuong.id_truyen  # Lấy truyện từ chương
            if truyen not in truyen_da_doc:
                truyen_da_doc[truyen] = {
                    'truyen': truyen,
                    'so_chuong_da_doc': 0
                }
            truyen_da_doc[truyen]['so_chuong_da_doc'] += 1  # Tăng số chương đã đọc
        context = {
            'truyen_da_doc': truyen_da_doc.values()  # Chuyển đổi dictionary thành list để dễ dàng hiển thị
        }
    else:
        context = {
            'truyen_da_doc': []
        }
    return render(request, 'reader/truyen_da_doc.html', context)




@login_required
def quan_ly_truyen_da_xem(request):
    user = request.user               # SELECT DISTINCT id_truyen   FROM Luotxem   WHERE user_id = <user_id>;
    truyens_luot_xem = Luotxem.objects.filter(user=user).values_list('id_truyen', flat=True).distinct()     # Lấy danh sách ID truyện đã xem. Values_list() là một phương thức hữu ích trong Django ORM để lấy các giá trị cụ thể từ các trường trong mô hình. Tham số flat=True cho phép bạn nhận được một danh sách đơn giản nếu bạn chỉ truy vấn một trường duy nhất.

    so_chuong_da_doc_dict = {}

    chuongs_da_doc = Chuongdadoc.objects.filter(user=user, chuong__id_truyen__in=truyens_luot_xem)  #  Lấy danh sách các chương đã đọc.

    for item in chuongs_da_doc:          # Đếm số chương đã đọc cho mỗi truyện.
        truyen = item.chuong.id_truyen
        so_chuong_da_doc_dict[truyen] = so_chuong_da_doc_dict.get(truyen, 0) + 1
        
    # Chuẩn bị dữ liệu truyền vào template: list dict gồm truyen và so_chuong_da_doc (có thể là 0 nếu chưa đọc chương nào)
    truyens = []

    truyens_obj = Truyen.objects.filter(id__in=truyens_luot_xem)         # Lấy thông tin về các truyện.
    
    for truyen in truyens_obj:
        so_chuong_doc = so_chuong_da_doc_dict.get(truyen, None)  # None nếu chưa đọc chương nào , Tạo danh sách các truyện với thông tin cần thiết.
        so_chuong_tong = truyen.so_luong_chuong  # Tổng số chương truyện
        truyens.append({
            'truyen': truyen,
            'so_chuong_da_doc': so_chuong_doc,
            'so_chuong_tong': so_chuong_tong,
        })
    theloais= TheLoai.objects.all()
    context = {
        'truyen_da_doc': truyens,
        'theloais': theloais,  # Truyền danh sách thể loại vào context
    }
    return render(request, 'reader/quan_ly_truyen_da_xem.html', context)