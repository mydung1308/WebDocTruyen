from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
#from bootstrap_modal_forms.mixins import PopRequestMixin, CreateUpdateAjaxMixin # type: ignore
from django.forms import ModelForm
#from bookstore.models import Chat, Book
from django import forms
from django.contrib.auth import get_user_model 
from django.contrib.auth.forms import AuthenticationForm
from .models import *
from django.core.exceptions import ValidationError
from django.forms import formset_factory
from django.forms import inlineformset_factory
from django.core.validators import EmailValidator
#User = get_user_model()

class UserForm(UserCreationForm):
    class Meta:
        model= User
        fields= ['first_name', 'last_name', 'username', 'email', 'password1']
    
    
class LoginForm(AuthenticationForm):
    class Meta:
        model = User  # Sử dụng model User hiện tại
        fields = ['username', 'password']  # Chỉ định các trường cần thiết

    #username = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Username'}))
    #password = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Password'}))

class ThemtheloaiForm(forms.ModelForm):
    class Meta:
        model = TheLoai
        fields = ['ten_the_loai']

class TheLoaiEditForm(forms.ModelForm):
    class Meta:
        model = TheLoai
        fields = ['ten_the_loai']


class TruyenForm(forms.ModelForm):
    the_loai = forms.ModelMultipleChoiceField(
        queryset=TheLoai.objects.all(),
        widget=forms.CheckboxSelectMultiple,
        required=True,
        label="Thể loại"
    )
    so_chuong = forms.IntegerField(min_value=1, label="Số chương")

    class Meta:
        model = Truyen
        fields = ['ten_truyen', 'anh_dai_dien', 'tom_tat_noi_dung', 'trang_thai', 'so_chuong']
        widgets = {
            'trang_thai': forms.Select(choices=Truyen.TrangThai.choices),
            'tom_tat_noi_dung': forms.Textarea(attrs={'rows': 4}),
        }
        labels = {
            'ten_truyen': "Tên truyện",
            'anh_dai_dien': "Ảnh đại diện",
            'tom_tat_noi_dung': "Giới thiệu truyện",
            'trang_thai': "Trạng thái",
        }

    def clean_ten_truyen(self):
        ten_truyen = self.cleaned_data['ten_truyen']
        if Truyen.objects.filter(ten_truyen=ten_truyen).exists():
            raise forms.ValidationError("Tên truyện đã tồn tại, vui lòng nhập tên khác.")
        return ten_truyen
    


class ChinhSuaThongTinForm(forms.ModelForm):
    username = forms.CharField(
        max_length=150,
        required=True,
        label="Tên đăng nhập",
        help_text="Tên đăng nhập không được trùng với người khác."
    )
    email = forms.EmailField(
        required=True,
        label="Email",
        validators=[EmailValidator(message="Email không hợp lệ")],
    )
    first_name = forms.CharField(max_length=30, required=False, label="Họ")
    last_name = forms.CharField(max_length=30, required=False, label="Tên")
    ten_hien_thi = forms.CharField(max_length=50, required=True, label="Tên hiển thị")
    gioi_tinh = forms.ChoiceField(
        choices=[(0, "Nam"), (1, "Nữ"), (2, "Khác")],
        widget=forms.Select(),
        label="Giới tính",
        required=False
    )
    anh_dai_dien = forms.ImageField(required=False, label="Ảnh đại diện")
    
    class Meta:
        model = User
        fields = ['username', 'email', 'first_name', 'last_name']

    def clean_username(self):
        username = self.cleaned_data['username']
        if User.objects.exclude(pk=self.instance.pk).filter(username=username).exists():
            raise forms.ValidationError("Tên đăng nhập đã tồn tại!")
        return username

    def clean_email(self):
        email = self.cleaned_data['email']
        if User.objects.exclude(pk=self.instance.pk).filter(email=email).exists():
            raise forms.ValidationError("Email đã được sử dụng!")
        return email
