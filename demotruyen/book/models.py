from django.db import models

# Create your models here.
#from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.hashers import make_password
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import User
import uuid
from django.contrib.auth import get_user_model
from django.urls import reverse 
from datetime import datetime
from django.core.validators import MinValueValidator, MaxValueValidator



    

# Quên mật khẩu
class PasswordReset(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    reset_id = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    created_when = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Password reset for {self.user.username} at {self.created_when}"


# Bảng thông tin người dùng

class ThongTinNguoiDung(models.Model):
    class GioiTinh(models.IntegerChoices):
        NAM = 0, 'Nam'
        NU = 1, 'Nữ'
        KHAC = 2, 'Khác'

    class VaiTro(models.IntegerChoices):
        NGUOI_DUNG = 0, 'Người dùng'
        TAC_GIA = 1, 'Tác giả'
        QUAN_TRI = 2, 'Quản trị viên'



    user = models.OneToOneField(User, on_delete=models.CASCADE,related_name="thong_tin_nguoi_dung")
    #user_name = models.CharField(max_length=150, unique=True)
    #email = models.EmailField(_('email address'), unique=True)
    #mat_khau = models.CharField(max_length=255)
    ten_hien_thi = models.CharField(max_length=255)
    anh_dai_dien = models.ImageField(upload_to='uploads/avatars/', blank=True, null=True)
    gioi_tinh = models.SmallIntegerField(
        choices=GioiTinh.choices,
        default=GioiTinh.NAM,
        help_text="Giới tính của người dùng"
    )
    #gioi_tinh = models.SmallIntegerField(help_text="Giới tính của người dùng: 0 - Nam, 1 - Nữ, 2 - Khác")
    role = models.IntegerField(choices=VaiTro.choices,
        default=VaiTro.NGUOI_DUNG,
        help_text="Vai trò của người dùng")
    last_role = models.IntegerField(choices=VaiTro.choices,
        default=VaiTro.NGUOI_DUNG,
        help_text="Vai trò trước đây của người dùng")

    def __str__(self):
     return f'{self.id} - {self.ten_hien_thi}'

    
    #def save(self, *args, **kwargs):
        #if self.mat_khau and not self.mat_khau.startswith('pbkdf2_sha256$'):
            #self.mat_khau = make_password(self.mat_khau) #make_password() sẽ mã hóa mật khẩu mỗi lần model được cập nhật, ngay cả khi mật khẩu đã được mã hóa trước đó.
        #super().save(*args, **kwargs)


# Bảng tác giả

class TacGia(models.Model):
    id_nguoi_dung = models.OneToOneField('ThongTinNguoiDung', on_delete=models.CASCADE, related_name="tac_gia") #tac_gia = ThongTinNguoiDung.objects.get(user=user).tac_gia
    ten_tac_gia = models.CharField(max_length=255)
    is_locked = models.BooleanField(default=False, help_text="Tác giả bị khóa hay không")  # Add this field

    def __str__(self):
        return self.ten_tac_gia


# Bảng truyen yeu thich

class TruyenYeuThich(models.Model):
    id_nguoi_dung = models.ForeignKey('ThongTinNguoiDung', on_delete=models.CASCADE,related_name='truyen_yeu_thich_user')  # Mối quan hệ với người dùng
    id_truyen = models.ForeignKey('Truyen', on_delete=models.CASCADE, related_name='truyen_yeu_thich_list') # Mối quan hệ với truyện

    def __str__(self):
        return f'{self.id_truyen.ten_truyen}' #- Yêu thích của {self.id_nguoi_dung.thong_tin_nguoi_dung.user_name}'



# Bảng truyện

class Truyen(models.Model):
    class TrangThai(models.TextChoices):  # Sử dụng TextChoices thay vì danh sách tuple
        DANG_RA = 'dang_ra', 'Đang ra'
        HOAN_THANH = 'hoan_thanh', 'Hoàn thành'
        TAM_NGUNG = 'tam_ngung', 'Tạm ngừng'

    id_tac_gia = models.ForeignKey('TacGia', on_delete=models.CASCADE, related_name='truyen') 
    ten_truyen = models.CharField(max_length=255, unique=True)  # Đảm bảo mỗi truyện có tên duy nhất, tránh trùng lặp.
    so_luong_chuong = models.PositiveIntegerField(default=0) #tránh lưu giá trị âm cho so_luong_chuong, luot_xem, luot_thich.
    tom_tat_noi_dung = models.TextField(help_text="Tóm tắt nội dung chính của truyện. Không giới hạn độ dài.")
    anh_dai_dien = models.ImageField(upload_to='uploads/truyen/')
    luot_xem = models.PositiveIntegerField(default=0)
    luot_thich = models.PositiveIntegerField(default=0)
    ngay_cap_nhat = models.DateTimeField(auto_now=True)
    trang_thai = models.CharField(max_length=20, choices=TrangThai.choices, default=TrangThai.DANG_RA)
    khoa = models.BooleanField(default=False)

    def __str__(self):
        return self.ten_truyen
    
    def get_absolute_url(self):
        return reverse('reader-chitiettruyen', kwargs={'truyen_id': self.id})
    
   
    
    #def __str__(self):
        #return self.ten_truyen

    def bi_khoa(self):
        self.khoa = True
        self.save()

    def mo_khoa(self):
        self.khoa = False
        self.save()

    


# Bảng thể loại truyện

class TheLoaiTruyen(models.Model):
    id_the_loai = models.ForeignKey('TheLoai', on_delete=models.CASCADE, related_name='truyen_thuoc_the_loai')
    id_truyen = models.ForeignKey('Truyen', on_delete=models.CASCADE, related_name='the_loai_cua_truyen')
    ngay_them = models.DateTimeField(auto_now_add=True)  # Lưu ngày thêm thể loại vào truyện

    class Meta:
        constraints = [
        models.UniqueConstraint(
            fields=['id_truyen', 'id_the_loai'], # Đảm bảo mỗi truyện và thể loại truyện là duy nhấtnhất
            name='unique_truyen_theloai'
        )
    ]
          

    def __str__(self):
        return f'{self.id_truyen.ten_truyen} - {self.id_the_loai.ten_the_loai}'
  
    

# Bảng thể loại

class TheLoai(models.Model):
    ten_the_loai = models.CharField(max_length=100, unique=True)

    class Meta:
        ordering = ["ten_the_loai"] #Khi truy vấn, thể loại sẽ được sắp xếp tăng dần theo bảng chữ cái.
  
    def __str__(self):
        return self.ten_the_loai.capitalize() # Viết hoa chữ cái đầu
    



# Bảng thích truyện

class ThichTruyen(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='truyen_da_thich') #, related_name='story_likes'
    id_truyen = models.ForeignKey('Truyen', on_delete=models.CASCADE, related_name='truyen_luot_thich')  #, related_name='likes'
    thoigian_thich = models.DateTimeField(auto_now_add=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['user', 'id_truyen'], name='unique_user_thich_truyen') #Đảm bảo mỗi người dùng chỉ có thể thích một truyện một lần.
        ]

    def __str__(self):
        return f"{self.user.username} thích {self.id_truyen.ten_truyen}"
        



# Đánh giá truyện 
 
class DanhgiaTruyen(models.Model):
    id_truyen = models.ForeignKey('Truyen', on_delete=models.CASCADE, related_name='danh_gia')
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='danh_gia_truyen')
    danhgia = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(5)],
        help_text="Đánh giá từ 0 đến 5"
    )
    binhluan = models.TextField(blank=True, null=True, help_text="Bình luận về truyện (Tùy chọn)")
    thoigian_danhgia = models.DateTimeField(auto_now_add=True)
    capnhat = models.DateTimeField(auto_now=True)

    parent = models.ForeignKey(
        'self',
        null=True,
        blank=True,
        related_name='phan_hoi',
        on_delete=models.CASCADE
    )

    #class Meta:
        #constraints = [
            #models.UniqueConstraint(fields=['user', 'id_truyen'], name='unique_user_danhgia_truyen')  # Đảm bảo mỗi người dùng chỉ có thể thích một truyện một lần
        #]
        #ordering = ['-thoigian_danhgia']

    def __str__(self):
        return f'{self.user.username} đánh giá {self.id_truyen.ten_truyen} - {self.danhgia} sao'



# Bảng lượt xem

class Luotxem(models.Model):
    id_truyen = models.ForeignKey('Truyen', on_delete=models.CASCADE, related_name='truyen_luot_xem')  # Lượt xem của truyện
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True, related_name='luot_xem_user')  # Lượt xem của người dùng null=True, blank=True nghĩa là trường hợp ng dùng chưa đăng nhập thì vẫn có thể lưu lại lượt xem của truyện.
    ip_address = models.GenericIPAddressField()
    thoigian_xem = models.DateTimeField(auto_now_add=True)

    class Meta:
        indexes = [
            models.Index(fields=['id_truyen', 'ip_address', 'thoigian_xem']), #indexes giúp tối ưu hóa các truy vấn tìm kiếm hoặc lọc dữ liệu theo các trường được chỉ định, điều này giúp các truy vấn tìm kiếm theo những trường này nhanh hơn khi có lượng dữ liệu lớn.
        ]


# Bảng ThongTinChuongTruyen

class ThongTinChuongTruyen(models.Model):
    id_truyen = models.ForeignKey('Truyen', on_delete=models.CASCADE, related_name='chuong_truyen')  # Lưu các chương của truyện
    ten_chuong = models.CharField(max_length=255)
    noi_dung_chuong = models.TextField()
    thu_tu = models.IntegerField(default=0)  # Thứ tự chương

    class Meta:
        ordering = ['thu_tu']  # Sắp xếp các chương theo thứ tự

    def __str__(self):
        return f'{self.ten_chuong} - {self.id_truyen.ten_truyen}'
    
    def get_absolute_url(self):
        return reverse('reader-docchuong', kwargs={'truyen_id': self.id_truyen.id, 'thu_tu': self.thu_tu})

    

 
 # Chương đã đọc của người dùng 

class Chuongdadoc(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='da_doc_chuong')  # Lượt đọc của người dùng
    chuong = models.ForeignKey('ThongTinChuongTruyen', on_delete=models.CASCADE, related_name='luot_doc')  # Chương đã đọc
    thoigian_doc = models.DateTimeField(auto_now=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=['user', 'chuong'], name='unique_user_chuong_dadoc')  # Đảm bảo mỗi người dùng chỉ có thể đọc một chương duy nhất
        ]
        ordering = ['-thoigian_doc']  # Sắp xếp theo thời gian đọc

    def __str__(self):
        return f'{self.user.username} đã đọc chương {self.chuong.ten_chuong} vào {self.thoigian_doc}'
    


 # Bảng feedback

class Feedback(models.Model):
    feedback = models.TextField(null=True, blank=True, help_text="Phản hồi của người dùng về dịch vụ")
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='feedback_user')

    def __str__(self):
        return self.feedback[:50] if self.feedback else 'Không có phản hồi'






