from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views

#URL GIAO DIỆN CHUNG
urlpatterns = [
    path('', views.Home, name='home'),
    path('truyen/<int:truyen_id>/', views.chi_tiet_truyen, name='chitiettruyen'),
    path('register/', views.RegisterView, name='register'),
    path('login/', views.LoginView, name='login'),
    path('logout/', views.LogoutView, name='logout'),
    path('forgot-password/', views.ForgotPassword, name='forgot-password'),
    path('password-reset-sent/<str:reset_id>/', views.PasswordResetSent, name='password-reset-sent'),
    path('reset-password/<str:reset_id>/', views.ResetPassword, name='reset-password'),
    path('truyen/<int:truyen_id>/chuong-<int:thu_tu>/', views.doc_chuong, name='doc_chuong'),
    path('truyen/<int:truyen_id>/doc-tu-dau/', views.doc_tu_first, name='doc_tu_first'),
    path('truyen/<int:truyen_id>/doc-tap-moi/', views.doc_tap_new, name='doc_tap_new'),
    path('tim-kiem/', views.tim_kiem_truyen, name='tim_kiem_truyen'),
    #path('the-loai', views.Theloai, name='the_loai'),
    path('the-loai/<int:pk>/', views.Theloai, name='the_loai'),
    #path('truyen-moi-cap-nhat/', views.truyen_moi_cap_nhat, name='truyen_moi_cap_nhat'),



#URL ADMIN 

    path('admin-home/', views.AdminHome, name='admin-home'),
    path('admin-home/truyen/<int:truyen_id>/', views.chi_tiet_truyen1, name='admin-chitiettruyen'),
    path('admin-home/truyen/<int:truyen_id>/chuong-<int:thu_tu>/', views.doc_chuong1, name='admin-docchuong'),
    path('admin-home/the-loai/<int:pk>/', views.Theloai1, name='admin-theloai'),
    path('thongtin-users/', views.ListUserView.as_view(), name='list-user'),
    path('quanly-theloai', views.Quanlytheloai, name='qltheloai'),
    path('them-theloai', views.Themtheloai, name='themtheloai'),
    path('sua-theloai/<int:pk>/', views.sua_the_loai, name='suatheloai'),
    #path('sua-theloai/<int:pk>', views.TheLoaiEditView.as_view(), name='suatheloai'),
    path('xoa-theloai/<int:pk>',views.xoa_the_loai, name='xoatheloai'),
    #path('xoa-theloai/<int:pk>', views.TheLoaiDeleteView.as_view(), name='xoatheloai'),
    path('quanly-truyen', views.Quanlytruyen, name='qltruyen'),
    path('admin-home/tim-kiem/', views.tim_kiem_truyen1, name='admin-timkiemtruyen'),

    path('dang-ky-truyen/', views.dang_ky_truyen, name='dang_ky_truyen'),
    path('sua-truyen/<int:truyen_id>', views.chinh_sua_truyen, name='suatruyen'),
    path('xoa-truyen/<int:pk>', views.xoa_truyen, name='xoatruyen'),
    
    #path('truyen/<int:truyen_id>/', views.chi_tiet_truyen, name='chi_tiet_truyen'),
    # ...
    #path('them-truyen', views.Themtruyen, name='themtruyen'),
    #path('danhsach-theloai', views.Danhsachtheloai, name='ds-theloai'),
    #path('aabook_form/', views.aabook_form, name='aabook_form'),   # sửa lại




#URL READER

    path('reader/', views.ReaderHome, name='reader-home'),
    path('reader/truyen/<int:truyen_id>/', views.chi_tiet_truyen2, name='reader-chitiettruyen'),
    path('reader/truyen/<int:truyen_id>/chuong-<int:thu_tu>/', views.doc_chuong2, name='reader-docchuong'),
    path('reader/tim-kiem/', views.tim_kiem_truyen2, name='reader-timkiemtruyen'),
    path('reader/the-loai/<int:pk>/', views.Theloai2, name='reader-theloai'),
    path('reader/thong-tin-ca-nhan/', views.thong_tin_ca_nhan, name='reader-thongtincanhan'),
    #path('reader/thong-tin-ca-nhan/sua-thong-tin-user/', views. edit_user_info, name='reader-sua-thongtincanhan'),
    path('reader/thong-tin-ca-nhan/sua-thong-tin-user/', views.chinh_sua_thong_tin, name='reader-sua-thongtincanhan'),
    path('thich/<int:truyen_id>/', views.toggle_thich_truyen, name='toggle_thich_truyen'),
    path('truyen/<int:truyen_id>/binhluan/', views.binhluan_truyen, name='reader-binh_luan_truyen'),
    path('reader/truyen/<int:truyen_id>/doc-tu-dau/', views.doc_tu_dau, name='doc_tu_dau'),
    path('reader/truyen/<int:truyen_id>/doc-tap-moi/', views.doc_tap_moi, name='doc_tap_moi'),
    path('theo_doi/<int:truyen_id>/', views.toggle_theo_doi_truyen, name='toggle_theo_doi_truyen'),
    path('truyen/<int:truyen_id>/reply/', views.reply_danhgia, name='reply-danhgia'),
    path('sua-binh-luan/<int:id>/', views.sua_binh_luan, name='sua-binh-luan'),
    path('binhluan/<int:binhluan_id>/xoa/', views.xoa_binhluan, name='xoa-binh-luan'),
    path('trang-ca-nhan/', views.trang_ca_nhan, name='trang_ca_nhan'),
    path('chuong/<int:chuong_id>/danh-dau-da-doc/', views.danh_dau_da_doc, name='danh_dau_da_doc'),
    path('truyen/theo-doi/', views.truyen_dang_theo_doi, name='truyen_theo_doi'),
    #path('truyen-dang-theo-doi/', views.gettruyendangtheodoi, name='truyen-dang-theo-doi'),
    path('truyen-da-doc/', views.truyen_da_doc, name='truyen_da_doc'),

    path('truyen-da-xem/', views.quan_ly_truyen_da_xem, name='quan_ly_truyen_da_xem'),

    





    




]