from django.contrib import admin
#from django.contrib.auth.admin import UserAdmin

from .models import (
    PasswordReset, ThongTinNguoiDung, TacGia, TruyenYeuThich, 
    Truyen, TheLoaiTruyen, TheLoai, ThichTruyen, DanhgiaTruyen, 
    Luotxem, ThongTinChuongTruyen, Chuongdadoc, Feedback
)

@admin.register(ThongTinNguoiDung)
class ThongTinNguoiDungAdmin(admin.ModelAdmin):
    list_display = ('id', 'ten_hien_thi', 'gioi_tinh', 'role', 'last_role')
    search_fields = ('ten_hien_thi', 'user__username')

@admin.register(TacGia)
class TacGiaAdmin(admin.ModelAdmin):
    list_display = ('id', 'ten_tac_gia', 'is_locked')
    search_fields = ('ten_tac_gia',)

@admin.register(Truyen)
class TruyenAdmin(admin.ModelAdmin):
    list_display = ('id', 'ten_truyen', 'id_tac_gia', 'so_luong_chuong', 'trang_thai', 'ngay_cap_nhat')
    list_filter = ('trang_thai', 'id_tac_gia')
    search_fields = ('ten_truyen',)

@admin.register(TheLoai)
class TheLoaiAdmin(admin.ModelAdmin):
    list_display = ('id', 'ten_the_loai')
    search_fields = ('ten_the_loai',)

@admin.register(TheLoaiTruyen)
class TheLoaiTruyenAdmin(admin.ModelAdmin):
    list_display = ('id', 'id_truyen', 'id_the_loai', 'ngay_them')
    list_filter = ('id_the_loai',)

@admin.register(TruyenYeuThich)
class TruyenYeuThichAdmin(admin.ModelAdmin):
    list_display = ('id', 'id_nguoi_dung', 'id_truyen')

@admin.register(ThichTruyen)
class ThichTruyenAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'id_truyen', 'thoigian_thich')

@admin.register(DanhgiaTruyen)
class DanhgiaTruyenAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'id_truyen', 'danhgia', 'thoigian_danhgia')
    list_filter = ('danhgia',)

@admin.register(Luotxem)
class LuotxemAdmin(admin.ModelAdmin):
    list_display = ('id', 'id_truyen', 'user', 'ip_address', 'thoigian_xem')
    list_filter = ('id_truyen',)

@admin.register(ThongTinChuongTruyen)
class ThongTinChuongTruyenAdmin(admin.ModelAdmin):
    list_display = ('id', 'id_truyen', 'ten_chuong', 'thu_tu')
    list_filter = ('id_truyen',)
    search_fields = ('ten_chuong',)

@admin.register(Chuongdadoc)
class ChuongdadocAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'chuong', 'thoigian_doc')
    list_filter = ('user',)

@admin.register(Feedback)
class FeedbackAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'feedback')
    search_fields = ('user__username', 'feedback')

@admin.register(PasswordReset)
class PasswordResetAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'reset_id', 'created_when')



# Tùy chọn hiển thị trong admin site
admin.site.site_header = "Hệ thống Quản lý Truyện"
admin.site.site_title = "Admin Quản lý Truyện"
admin.site.index_title = "Quản lý Hệ thống"
