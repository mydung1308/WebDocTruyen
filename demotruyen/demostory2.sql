-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th7 27, 2025 lúc 10:42 AM
-- Phiên bản máy phục vụ: 8.0.39
-- Phiên bản PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demostory2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add the loai', 7, 'add_theloai'),
(26, 'Can change the loai', 7, 'change_theloai'),
(27, 'Can delete the loai', 7, 'delete_theloai'),
(28, 'Can view the loai', 7, 'view_theloai'),
(29, 'Can add feedback', 8, 'add_feedback'),
(30, 'Can change feedback', 8, 'change_feedback'),
(31, 'Can delete feedback', 8, 'delete_feedback'),
(32, 'Can view feedback', 8, 'view_feedback'),
(33, 'Can add password reset', 9, 'add_passwordreset'),
(34, 'Can change password reset', 9, 'change_passwordreset'),
(35, 'Can delete password reset', 9, 'delete_passwordreset'),
(36, 'Can view password reset', 9, 'view_passwordreset'),
(37, 'Can add thong tin nguoi dung', 10, 'add_thongtinnguoidung'),
(38, 'Can change thong tin nguoi dung', 10, 'change_thongtinnguoidung'),
(39, 'Can delete thong tin nguoi dung', 10, 'delete_thongtinnguoidung'),
(40, 'Can view thong tin nguoi dung', 10, 'view_thongtinnguoidung'),
(41, 'Can add tac gia', 11, 'add_tacgia'),
(42, 'Can change tac gia', 11, 'change_tacgia'),
(43, 'Can delete tac gia', 11, 'delete_tacgia'),
(44, 'Can view tac gia', 11, 'view_tacgia'),
(45, 'Can add truyen', 12, 'add_truyen'),
(46, 'Can change truyen', 12, 'change_truyen'),
(47, 'Can delete truyen', 12, 'delete_truyen'),
(48, 'Can view truyen', 12, 'view_truyen'),
(49, 'Can add thong tin chuong truyen', 13, 'add_thongtinchuongtruyen'),
(50, 'Can change thong tin chuong truyen', 13, 'change_thongtinchuongtruyen'),
(51, 'Can delete thong tin chuong truyen', 13, 'delete_thongtinchuongtruyen'),
(52, 'Can view thong tin chuong truyen', 13, 'view_thongtinchuongtruyen'),
(53, 'Can add truyen yeu thich', 14, 'add_truyenyeuthich'),
(54, 'Can change truyen yeu thich', 14, 'change_truyenyeuthich'),
(55, 'Can delete truyen yeu thich', 14, 'delete_truyenyeuthich'),
(56, 'Can view truyen yeu thich', 14, 'view_truyenyeuthich'),
(57, 'Can add chuongdadoc', 15, 'add_chuongdadoc'),
(58, 'Can change chuongdadoc', 15, 'change_chuongdadoc'),
(59, 'Can delete chuongdadoc', 15, 'delete_chuongdadoc'),
(60, 'Can view chuongdadoc', 15, 'view_chuongdadoc'),
(61, 'Can add thich truyen', 16, 'add_thichtruyen'),
(62, 'Can change thich truyen', 16, 'change_thichtruyen'),
(63, 'Can delete thich truyen', 16, 'delete_thichtruyen'),
(64, 'Can view thich truyen', 16, 'view_thichtruyen'),
(65, 'Can add the loai truyen', 17, 'add_theloaitruyen'),
(66, 'Can change the loai truyen', 17, 'change_theloaitruyen'),
(67, 'Can delete the loai truyen', 17, 'delete_theloaitruyen'),
(68, 'Can view the loai truyen', 17, 'view_theloaitruyen'),
(69, 'Can add luotxem', 18, 'add_luotxem'),
(70, 'Can change luotxem', 18, 'change_luotxem'),
(71, 'Can delete luotxem', 18, 'delete_luotxem'),
(72, 'Can view luotxem', 18, 'view_luotxem'),
(73, 'Can add danhgia truyen', 19, 'add_danhgiatruyen'),
(74, 'Can change danhgia truyen', 19, 'change_danhgiatruyen'),
(75, 'Can delete danhgia truyen', 19, 'delete_danhgiatruyen'),
(76, 'Can view danhgia truyen', 19, 'view_danhgiatruyen');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$GJDCSUOysW15ZLyy3FuBLI$PLXBilJyhK/2q61vUGd7ytFuWcjXqkAOCTZR20eOdAo=', '2025-07-07 08:42:50.655062', 1, 'demostory2', '', '', 'mydung.works@gmail.com', 1, 1, '2025-02-08 23:39:20.552583'),
(2, 'pbkdf2_sha256$870000$KMNuHmnrqfq8gBGQEgJpgd$5ZuKJnKKvfNMakyd6fEbo/WXqjH2VmUwU8CZbFTbfZM=', '2025-07-27 04:02:48.088452', 0, 'reader1', 'Nguyễn Thị', 'Mỹ Dung', 'mydung@gmail.com', 0, 1, '2025-02-08 23:44:23.000000'),
(3, 'pbkdf2_sha256$870000$BIAjCZ3qbmVAueC2XyGN94$mCwDYDsbeVtRlqjqDqltl2anst5cPkNNEkPjA/YC6D4=', '2025-06-06 08:31:48.738385', 0, 'reader2', 'Nguyễn', 'Văn A', 'reader2@gmail.com', 0, 1, '2025-05-15 15:15:17.871198');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_chuongdadoc`
--

CREATE TABLE `book_chuongdadoc` (
  `id` bigint NOT NULL,
  `thoigian_doc` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `chuong_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_chuongdadoc`
--

INSERT INTO `book_chuongdadoc` (`id`, `thoigian_doc`, `user_id`, `chuong_id`) VALUES
(5, '2025-05-30 07:04:11.568810', 2, 23);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_danhgiatruyen`
--

CREATE TABLE `book_danhgiatruyen` (
  `id` bigint NOT NULL,
  `danhgia` int NOT NULL,
  `binhluan` longtext COLLATE utf8mb4_general_ci,
  `thoigian_danhgia` datetime(6) NOT NULL,
  `capnhat` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `id_truyen_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_danhgiatruyen`
--

INSERT INTO `book_danhgiatruyen` (`id`, `danhgia`, `binhluan`, `thoigian_danhgia`, `capnhat`, `user_id`, `id_truyen_id`, `parent_id`) VALUES
(1, 0, 'đỉnh lắm luôn á nha', '2025-05-07 08:34:30.095505', '2025-05-24 08:41:05.002512', 2, 11, NULL),
(6, 0, 'good', '2025-05-24 07:06:56.126050', '2025-05-24 07:06:56.126105', 2, 11, 1),
(7, 0, 'i think so', '2025-05-24 07:11:23.094380', '2025-05-24 08:14:12.342223', 3, 11, 1),
(8, 0, 'dung roi', '2025-05-24 07:32:00.610502', '2025-05-24 07:32:00.610549', 2, 11, 6),
(9, 0, 'yes i do', '2025-05-24 07:32:17.895133', '2025-05-24 08:19:40.313606', 2, 11, 7),
(10, 0, '9.5 điểm', '2025-05-24 07:33:21.990461', '2025-05-24 08:13:37.713058', 3, 11, 9),
(11, 0, 'hay vay', '2025-05-25 07:57:36.817096', '2025-05-25 07:57:36.817123', 2, 11, NULL),
(12, 0, 'hay vay', '2025-05-25 07:58:23.587211', '2025-05-25 07:58:23.587240', 2, 11, NULL),
(13, 0, 'hay vay', '2025-05-25 07:59:49.718919', '2025-05-25 07:59:49.718945', 2, 11, NULL),
(14, 0, 'hay xuất sắc', '2025-05-25 08:03:14.157409', '2025-05-25 08:19:34.861438', 2, 11, NULL),
(15, 0, 'haha', '2025-05-25 08:19:08.169980', '2025-05-25 08:19:08.170021', 2, 11, 14),
(16, 0, '10 điểm ko nhưng quá tr qua đất hay', '2025-05-25 08:20:50.402908', '2025-05-25 08:21:09.665677', 2, 11, 6),
(17, 0, 'đr rồi á bạn', '2025-05-25 08:21:25.356234', '2025-05-25 08:21:25.356287', 2, 11, 7),
(18, 0, '10 điểm luôn đi', '2025-05-25 08:22:23.043808', '2025-05-25 08:22:23.043861', 2, 11, 10),
(19, 0, 'đây là lần đầu tiên mình đọc truyện luôn á', '2025-05-25 08:23:01.691949', '2025-05-25 08:23:26.054193', 2, 11, NULL),
(20, 0, 'tôi cũng mới đọc xong á', '2025-05-25 09:11:06.864694', '2025-05-25 09:11:27.495970', 3, 11, 19),
(21, 0, 'hihi', '2025-05-25 09:11:19.233681', '2025-05-25 09:11:19.233737', 3, 11, 15),
(22, 0, 'tôi được bạn tôi giới thiệu cho', '2025-05-25 09:11:41.630652', '2025-05-25 09:11:41.630701', 3, 11, NULL),
(23, 0, 'I am died for it', '2025-05-26 01:33:46.147973', '2025-05-26 01:33:46.148124', 2, 11, NULL),
(24, 0, '', '2025-05-28 06:47:27.893105', '2025-05-28 06:47:49.323337', 2, 11, NULL),
(25, 0, '99%', '2025-05-28 06:47:39.923864', '2025-05-28 06:47:39.923916', 2, 11, 24),
(26, 0, 'hay đó tui xin phép khôi phục bình luận', '2025-05-28 07:36:50.134451', '2025-05-28 07:55:24.748334', 2, 11, 23),
(27, 0, 'good good', '2025-05-28 07:37:51.356257', '2025-05-28 07:37:51.356309', 3, 11, 26),
(28, 0, 'hay hé', '2025-05-28 07:38:11.532834', '2025-05-28 07:38:11.532887', 3, 11, 23),
(29, 0, '', '2025-05-28 07:38:58.975925', '2025-05-28 07:42:55.466299', 2, 11, 27),
(30, 0, '1000 % outstanding', '2025-05-28 07:41:49.850376', '2025-05-28 07:41:49.850391', 3, 11, 29),
(31, 0, 'sao xóa vậy bạn', '2025-05-28 07:56:37.128631', '2025-05-28 07:56:37.128658', 3, 11, 29),
(32, 0, 'xin phép xóa nha', '2025-05-28 07:57:55.730229', '2025-05-28 07:57:55.730257', 2, 11, 29),
(33, 0, '', '2025-05-28 08:49:35.533151', '2025-05-28 08:51:26.025745', 2, 11, NULL),
(34, 0, '223', '2025-05-28 08:49:42.772800', '2025-05-28 08:50:06.285535', 2, 11, 33),
(35, 0, 'oki', '2025-05-28 08:50:30.871775', '2025-05-28 08:50:30.871827', 3, 11, 33),
(36, 0, '2 oki', '2025-05-28 08:50:46.823009', '2025-05-28 08:50:46.823061', 3, 11, 34),
(37, 0, 'thanks', '2025-05-28 08:51:15.809425', '2025-05-28 08:51:15.809480', 2, 11, 36),
(38, 0, '', '2025-05-30 01:37:16.748854', '2025-06-06 08:01:29.288745', 2, 11, NULL),
(39, 0, 'Chỉ còn khoảng 20 ngày nữa, kỳ thi tốt nghiệp THPT 2025, dấu mốc quan trọng của lứa học sinh đầu tiên theo Chương trình Giáo dục phổ thông 2018, sẽ diễn ra. Thế nhưng, ở thời điểm này, nhiều trường đại học lớn thay đổi tổ hợp xét tuyển đang khiến không ít thí sinh rơi vào tình trạng “chưa thi đã trượt\".', '2025-06-06 08:12:19.558900', '2025-06-06 08:12:19.558951', 2, 11, NULL),
(40, 0, 'Theo ghi nhận, đến nay, đã có 5 trường đại học lớn phía Bắc không tuyển sinh nhiều ngành trọng điểm bằng khối C00 (tổ hợp văn, sử, địa) gồm: Trường Đại học Khoa học Xã hội và Nhân văn, Trường Đại học Luật (Đại học Quốc gia Hà Nội), Trường Đại học Thủ đô Hà Nội, Trường Đại học Mở Hà Nội, Học viện Báo chí và Tuyên truyền (từ 2024) .', '2025-06-06 08:13:29.488179', '2025-06-06 08:14:11.099012', 3, 11, NULL),
(41, 0, 'Thay vào đó, các trường này ưu tiên tổ hợp có môn toán hoặc tiếng Anh như: C03 (toán, văn, sử), A07 (toán, sử, địa), A01 (toán, lý, tiếng Anh), D01 (toán, văn, tiếng Anh), D14 (văn, sử, tiếng Anh) và D15 (văn, địa, tiếng Anh) hay D66 (văn, giáo dục kinh tế và pháp luật, tiếng Anh)….', '2025-06-06 08:13:51.200045', '2025-06-06 08:14:24.083114', 3, 11, 39),
(42, 0, 'TS Lê Viết Khuyến, nguyên Phó vụ trưởng Vụ Giáo dục Đại học, Bộ GD&ĐT, nhấn mạnh rằng vấn đề không nằm ở việc khối C00 còn phù hợp hay không, mà ở quá trình học tập và định hướng của học sinh.\r\n\r\nTheo chương trình cũ, học sinh được yêu cầu học đầy đủ các môn, thi đủ 3 môn bắt buộc và 3 môn tổ hợp khoa học tự nhiên/khoa học xã hội nên việc công bố tổ hợp sát kỳ thi sẽ không quá nghiêm trọng.', '2025-06-06 08:14:41.789873', '2025-06-06 08:14:41.789896', 3, 11, 40);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_feedback`
--

CREATE TABLE `book_feedback` (
  `id` bigint NOT NULL,
  `feedback` longtext COLLATE utf8mb4_general_ci,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_luotxem`
--

CREATE TABLE `book_luotxem` (
  `id` bigint NOT NULL,
  `ip_address` char(39) COLLATE utf8mb4_general_ci NOT NULL,
  `thoigian_xem` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  `id_truyen_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_luotxem`
--

INSERT INTO `book_luotxem` (`id`, `ip_address`, `thoigian_xem`, `user_id`, `id_truyen_id`) VALUES
(1, '127.0.0.1', '2025-05-09 05:58:56.826349', 1, 11),
(2, '127.0.0.1', '2025-05-09 05:59:01.192306', 1, 11),
(3, '127.0.0.1', '2025-05-09 05:59:04.253131', 1, 11),
(4, '127.0.0.1', '2025-05-09 05:59:05.625033', 1, 11),
(5, '127.0.0.1', '2025-05-09 06:00:59.576972', 1, 6),
(6, '127.0.0.1', '2025-05-09 06:01:02.018519', 1, 6),
(7, '127.0.0.1', '2025-05-09 06:01:57.155237', NULL, 7),
(8, '127.0.0.1', '2025-05-09 06:01:58.886487', NULL, 7),
(9, '127.0.0.1', '2025-05-09 06:22:05.208645', NULL, 5),
(10, '127.0.0.1', '2025-05-09 06:37:04.994531', 1, 1),
(11, '127.0.0.1', '2025-05-09 07:28:45.370977', 2, 11),
(15, '127.0.0.1', '2025-05-15 11:02:48.224587', NULL, 12),
(16, '127.0.0.1', '2025-05-15 15:46:45.775662', NULL, 12),
(17, '127.0.0.1', '2025-05-24 01:01:52.722850', 2, 12),
(18, '127.0.0.1', '2025-06-01 08:48:03.307357', 2, 15),
(19, '127.0.0.1', '2025-06-06 07:27:30.785442', 2, 11),
(20, '127.0.0.1', '2025-06-06 08:28:26.407351', 2, 11),
(21, '127.0.0.1', '2025-06-07 07:22:18.312305', 2, 17),
(22, '127.0.0.1', '2025-07-02 08:11:49.848943', 2, 11),
(23, '127.0.0.1', '2025-07-07 08:32:06.003369', 2, 11),
(24, '127.0.0.1', '2025-07-07 08:35:31.008874', 2, 17),
(25, '127.0.0.1', '2025-07-25 01:23:33.569857', 2, 11),
(26, '127.0.0.1', '2025-07-27 00:19:07.548556', 2, 11),
(27, '127.0.0.1', '2025-07-27 04:22:30.261302', 2, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_passwordreset`
--

CREATE TABLE `book_passwordreset` (
  `id` bigint NOT NULL,
  `reset_id` char(32) COLLATE utf8mb4_general_ci NOT NULL,
  `created_when` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_passwordreset`
--

INSERT INTO `book_passwordreset` (`id`, `reset_id`, `created_when`, `user_id`) VALUES
(1, 'ef3af60c1ed54007b6ebc4992cf14360', '2025-04-01 11:19:18.995071', 2),
(2, 'cce8d7a1fce8453d953159ddabe1e003', '2025-04-02 08:01:18.020004', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_tacgia`
--

CREATE TABLE `book_tacgia` (
  `id` bigint NOT NULL,
  `ten_tac_gia` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `id_nguoi_dung_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_tacgia`
--

INSERT INTO `book_tacgia` (`id`, `ten_tac_gia`, `is_locked`, `id_nguoi_dung_id`) VALUES
(1, 'Admin', 0, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_theloai`
--

CREATE TABLE `book_theloai` (
  `id` bigint NOT NULL,
  `ten_the_loai` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_theloai`
--

INSERT INTO `book_theloai` (`id`, `ten_the_loai`) VALUES
(16, 'Chữa lành'),
(13, 'Cổ đại'),
(25, 'Gia đình'),
(3, 'Hài hước vui nhộn'),
(21, 'Hành động'),
(18, 'Hiện đại'),
(15, 'Học đường'),
(1, 'Hư cấu huyền ảo'),
(19, 'Kiếp hiệp'),
(6, 'Kinh dị'),
(5, 'Ngôn tình'),
(14, 'Ngọt ngào'),
(20, 'Tiểu thuyết'),
(4, 'Trả thù'),
(17, 'Xuyên không');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_theloaitruyen`
--

CREATE TABLE `book_theloaitruyen` (
  `id` bigint NOT NULL,
  `ngay_them` datetime(6) NOT NULL,
  `id_the_loai_id` bigint NOT NULL,
  `id_truyen_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_theloaitruyen`
--

INSERT INTO `book_theloaitruyen` (`id`, `ngay_them`, `id_the_loai_id`, `id_truyen_id`) VALUES
(1, '2025-02-27 22:55:35.432747', 3, 1),
(2, '2025-02-27 22:56:32.342517', 5, 2),
(4, '2025-02-27 22:56:53.656915', 4, 4),
(5, '2025-02-27 22:57:08.384936', 6, 5),
(23, '2025-03-01 23:45:38.081273', 13, 6),
(57, '2025-05-07 07:01:07.907715', 15, 7),
(58, '2025-05-07 07:01:21.913511', 16, 11),
(59, '2025-05-07 07:01:21.921639', 13, 11),
(60, '2025-05-07 07:01:21.926570', 5, 11),
(61, '2025-05-07 07:01:21.931946', 14, 11),
(62, '2025-05-07 07:01:21.938144', 20, 11),
(85, '2025-05-14 09:33:30.253319', 16, 13),
(86, '2025-05-14 09:33:30.259399', 13, 13),
(87, '2025-05-14 09:33:30.265274', 3, 13),
(88, '2025-05-14 09:33:30.271371', 1, 13),
(89, '2025-05-14 09:33:30.276959', 17, 13),
(90, '2025-05-14 09:34:40.115062', 13, 12),
(91, '2025-05-14 09:34:40.119739', 3, 12),
(92, '2025-05-14 09:34:40.124178', 5, 12),
(93, '2025-05-14 09:34:40.128972', 14, 12),
(94, '2025-05-14 09:34:40.133835', 17, 12),
(95, '2025-05-15 11:04:27.261643', 16, 14),
(96, '2025-05-15 11:04:27.270380', 3, 14),
(97, '2025-05-15 11:04:27.288193', 18, 14),
(98, '2025-05-15 11:04:27.293603', 5, 14),
(99, '2025-05-15 11:04:27.298251', 14, 14),
(100, '2025-05-15 11:04:27.303513', 17, 14),
(104, '2025-05-15 11:48:47.411371', 25, 15),
(105, '2025-05-15 11:48:47.416012', 3, 15),
(125, '2025-06-07 07:10:52.133068', 16, 17),
(126, '2025-06-07 07:10:52.138890', 1, 17),
(127, '2025-06-07 07:10:52.144624', 5, 17),
(128, '2025-06-07 07:10:52.150365', 14, 17),
(129, '2025-06-07 07:10:52.155958', 20, 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_thichtruyen`
--

CREATE TABLE `book_thichtruyen` (
  `id` bigint NOT NULL,
  `thoigian_thich` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `id_truyen_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_thichtruyen`
--

INSERT INTO `book_thichtruyen` (`id`, `thoigian_thich`, `user_id`, `id_truyen_id`) VALUES
(2, '2025-04-11 08:51:45.695706', 2, 11),
(4, '2025-07-07 08:35:28.653622', 2, 17),
(5, '2025-07-07 08:36:10.229896', 2, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_thongtinchuongtruyen`
--

CREATE TABLE `book_thongtinchuongtruyen` (
  `id` bigint NOT NULL,
  `ten_chuong` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `noi_dung_chuong` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `thu_tu` int NOT NULL,
  `id_truyen_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_thongtinchuongtruyen`
--

INSERT INTO `book_thongtinchuongtruyen` (`id`, `ten_chuong`, `noi_dung_chuong`, `thu_tu`, `id_truyen_id`) VALUES
(1, 'Mở đầu câu truyện', 'Giới thiệu chung về nội dung truyện', 1, 1),
(2, 'Thị trấn sương mù', 'Người dân ở đây thân thiện và mến khách....', 2, 1),
(3, 'Mở đầu câu truyện', 'Giới thiệu về cốt truyện', 1, 2),
(4, 'Tuổi thơ kẹo ngọt', 'Cô gái xinh xắn dễ thương gặp chàng trai trong mơ.....', 2, 2),
(7, 'Giới thiệu câu truyện', 'Thiên tài là gì', 1, 4),
(8, 'Quá trình phát triển', 'Nam chính là người có trí nhớ siêu phạm...', 2, 4),
(9, 'Mở đầu câu truyện', 'Giới thiệu chung', 1, 5),
(10, 'Phiêu bạc giang hồ cung huynh đệ', 'Thử thách khó khăn nhưng nam chính không khuất phục', 2, 5),
(11, 'Giới thiệu câu truyện', 'Chào các đạo hữu đã đến với Huyền Lục, mục đích mình viết ‘lời mở đầu’ này như là một lời chào mừng các đạo hữu đã ghé thăm truyện của mình, đồng thời cũng là nơi khuyến cáo nhẹ về truyện. Truyện của mình có thể sẽ không hợp gout với nhiều người nhưng mình viết chủ yếu là muốn để lại một cái gì đó đại diện cho mong ước ‘viễn vông’ mà từ nhỏ hay đến lúc lớn mình vẫn mơ ước dù nó khó mà thành hiện thực được.\r\n\r\nVậy nên đây tự nhiên cũng là truyện đầu tay của mình. Truyền đầu tay dĩ nhiên sẽ có một số sai sót nhưng theo thời gian viết mình sẽ cố khắc phục.\r\n\r\nDưới đây là một số khuyến cáo:\r\n\r\nThứ nhất: Truyện không hậu cung, không ngựa giống. Mình đặc biệt không thích hai loại này nên truyện mình tuyệt sẽ không có.\r\n\r\nThứ hai: Truyện mình có một thể loại tương đối hiếm xuất hiện trong văn học, nhất là văn học phương Đông mặc dù dạo gần đây cũng đã có nhiều tác giả và tiểu thuyết gia bắt đầu đá sang nhưng số lượng cũng không nhiều. Thể loại này tương đối mặn với đại đa số đạo hữu nhưng nó là thể loại gì thì mình không nói bởi vì còn chưa đến lúc khui. Các đạo hữu lưu ý là được. Bonus là ở Trung không có tên để gọi cho thể loại này (hoặc ít nhất là mình không biết, dù đã tra google).\r\n\r\nThứ ba: Main không vô địch.\r\n\r\nThứ tư: Truyện không YY, đời sống thực tế của mình vẫn thoải mái lắm, thi thoảng có chút stress nhưng cũng không đến nỗi phải viết để giải tỏa.\r\n\r\nThứ năm: Truyện đan xen với sinh hoạt phàm nhân nên trong những chương đầu ít xuất hiện các yếu tố tu luyện hay mới vào là đánh nhau như truyện bên Trung. Trong truyện sẽ có các yếu tố về món ăn hay danh lam thắng cảnh hay một vài địa điểm du lịch được lấy ra từ đời sống hằng ngày của mình (khụ khụ, ngại quá) + một vài danh nhân trong lịch sử Việt Nam.\r\n\r\nThứ sáu: Về yếu tố ra chương thì nếu thuận lợi có thể là 1 chương/ngày, lâu thì 2-3 ngày mới có chương. Tệ hơn thì 1 tuần 1 chương. Các đạo hữu thông cảm, công việc của mình khá là nặng, chạy dự án liên tục, thời điểm rảnh rỗi mới có thể viết được nhưng mình sẽ cố đảm bảo chất lượng chương.\r\n\r\nThứ bảy: Về chất lượng chương như nói ở trên thì 1 chương mình viết trung bình rơi vào 2500-3000 chữ, chương nào có hứng thú mình có thể viết lên 4000-5000 chữ vẫn không sao. Mình không học hay làm việc ở các vị trí liên quan đến viết lách nên tốc độ viết truyện của mình có thể sẽ không bằng những tác giả khác.\r\n\r\nThứ tám: Mình sẽ không bỏ truyện, nội dung mình cũng đã xây dựng kha khá rồi, mặc dù đại cương nộp chỉ là một phần trong số đó (Khụ khụ, ad nào thấy nhớ mắt nhắm mắt mở, một số nội dung giữ bí mật vẫn thú vị hơn mà)\r\n\r\nThứ chín: Mình vốn không vội nên truyện... cũng không vội, mình sẽ cố gắng để tình tiết không phải quá chậm.\r\n\r\nThứ mười: Các đạo hữu đọc truyện hãy comment giao lưu cho rôm rả nhé nhưng nhớ comment lịch sự, đọc truyện vì giải trí nhưng đừng để rơi học thức, nhân phẩm và mặt mũi nhé.\r\n\r\nỞ trên là mười điều khuyến cáo của mình, nếu đạo hữu nào không thích thì có thể bấm nút quay lại để tìm đến một bộ truyện phù hợp với mình hơn. Xin cảm ơn!\r\n\r\nMột lần nữa, chào mừng các đạo hữu đến với Huyền Lục. Chúc các đạo hữu có một khoảng thời gian đọc truyện vui vẻ.\r\n\r\nKý tên,\r\n\r\nVệ Huyền Hy.', 1, 6),
(12, 'Đại nhãn tử', 'Tự cổ vạn năm, Huyền Lục chiếu viết Huyền Đô Đại Lục tu chân giới thịnh hành, người người tu luyện. Hai ngàn năm trước, Ma đạo hoành hành, tận diệt nhân gian, máu lửa khắp nơi, oán hận ngập trời.\r\n\r\nCổ Linh môn dẫn đầu chư môn chính phái công phạt ma đạo, năm đó tử thương vô số, cuối cùng chính đạo lấy thương đổi thương đẩy lùi ma đạo vào vùng viễn Tây Huyền Đô. Nhân gian yếu thế oán hận, không chịu cam lòng trước đại chiến đã liên hợp lại tạo thành Nhật – Nguyệt – Tinh Tam Đại Hoàng Triều, cộng đồng chính đạo thủ vững nhân gian, ngăn chặn ma đạo.\r\n\r\n...\r\n\r\n...\r\n\r\nĐại Nguyệt Hoàng Triều.\r\n\r\nNguyệt Hải Thành.\r\n\r\nTrong con hẻm nhỏ không người qua lại, một lão nhân lớn tuổi dáng người nhỏ bé mặt tồn các đốm đồi mồi, râu tóc bạc trắng, dáng người hơi khom, chân đứng hơi khụy gối, hai chân tạo hình chữ bát rất bắt mắt. Lão nhân hai tay bắt sau lưng, ánh mắt đang nhìn về góc hẻm, dù lớn tuổi nhưng đôi mắt của lão đặc biệt khác người, nó rất sáng.\r\n\r\nÁnh mắt ấy đang nhìn về một cái ‘xác’, ít nhất theo lão là vậy. Lão nhân trầm mặc một đoạn thời gian rồi mời quyết định lại gần, vươn cánh tay khô gầy ra kiểm tra. Đột nhiên mắt lão liền ngưng lại, đưa tay chạm động mạch tại cổ. Lão bất ngờ nói ra:\r\n\r\n“Ồ, còn chưa chết”\r\n\r\nThu tay về, lão liền trầm mặc một hồi rồi đứng dậy quay lưng đi về hướng con đường lớn. Một lát sau, một thanh niên trẻ tuổi chạy vào, mang cái ‘xác’ vác trên vai rồi đi ra. Ở đầu đường, lão nhân đang đứng đợi, thấy thanh niên nhân liền ra hiệu đi theo.\r\n\r\nMột lát sau, hai người một ‘xác’ đứng trước một tiệm thuốc, tiệm thuốc này nằm ngay tại một ngã tư đông người qua lại, ở ngoài treo một biển hiệu bằng gỗ cũ, trên đó ghi ba chữ.\r\n\r\nĐiền y quán.\r\n\r\nThanh niên nhân mang cái ‘xác’ đi vào y quán, thuận đường mà vào hậu viện rồi đặt lên giường. Lão nhân kiểm tra lại một lần nữa, quay lưng lại ném một túi bạc cho thanh niên.\r\n\r\n“Được rồi, công của ngươi đây”\r\n\r\n“Đa tạ, Điền đại phu”, thanh niên nhân cười nói, sau đó liền cúi chào rồi đi.\r\n\r\nLão nhân không có ý giữ lại, cũng không thèm nhìn tiếp mà ánh mắt lại chuyển về cái ‘xác’, à không, là một thiếu niên. Theo đánh giá của lão, thiếu niên này tầm mười lăm tuổi, quần áo tả tơi nhưng lão có thể nhận ra, chất liệu hạng trung, xuất thân không đến nỗi kém. Làn da có nhiều vết tím bị đánh đập, một vài nơi còn tồn vết máu khô, làn da trắng noãn lại khiến các vết thương này càng rõ rệt hơn.\r\n\r\nLão nhân nhíu mày, thầm nghĩ con cái nhà nào lại bị đánh thảm như thế này, nghĩ mãi không ra liền lắc đầu rồi quay lưng đi lấy thuốc chữa trị. Một hồi sau, trên người thiếu niên khắp nơi liền là vết băng, trang phục cũng đã được thay bằng một bộ khác, màu nâu sờn cũ, còn bộ trang phục kia lão liền vứt bỏ không suy nghĩ.\r\n\r\nLão nhân ngồi đợi thêm một khoảng thời gian, không thấy thiếu niên sẽ có dấu hiệu tỉnh lại, lão liền đóng cửa ra ngoài.\r\n\r\nLão nhân rời đi được một lúc, ở trên giường, thiếu niên liền có chút cử động, chợt gương mặt liền co lại, lộ vẻ thống khổ, hai tay run rẩy đưa lên ôm đầu lăn qua lăn lại, thân hình co rúm lại một hồi liền đình trệ lại, thở dốc ra, thiếu niên tỉnh lại rồi.\r\n\r\n“Lão phu còn sống?”, thiếu niên mở miệng, sau đó liền cảm thấy không đúng, giọng này không phải của hắn.\r\n\r\nHai tay đầy băng bó đưa lên sờ soạng trên người rồi lại sờ mặt, thiếu niên liền nhíu mày lại, đau, cả người đều đau. Thiếu niên liền sững sờ:\r\n\r\n“Lão phu lại đau? Đây là thế nào?”\r\n\r\nThiếu niên nhìn quanh liền phát hiện thau nước bằng đồng cạnh đầu giường, liền dùng tay chống người dậy, gắng gượng chịu đau nhìn về mặt thau.\r\n\r\nBỗng nhiên, gương mặt hắn liền dại ra.\r\n\r\nĐây là ai?\r\n\r\nLão phu đâu?\r\n\r\nĐây là đâu?\r\n\r\nVô số ý nghĩ hiện ra trong đầu thiếu nhiên, bất giác, thiếu niên liền nhìu mày, vô số ký ức dần dần xuất hiện trong đầu hắn. Thiếu niên đưa tay còn lại đưa lên lay lay ấn đường, có chút phiền não.\r\n\r\n...\r\n\r\nMột lát sau.\r\n\r\n“Ra vậy, lão phu chết rồi”, thiếu niên thều thào nói.\r\n\r\nHắn ngẫm một chút liền nhìn lại mặt thau, nhìn kỹ lại dung mạo của cơ thể này. Thiếu niên liền gật đầu hài lòng, mi thanh mục tú, làn da trắng như ngọc, đôi mắt có chút to hơn người thường, hắc bạch phân minh, gọi chung là tiểu bạch kiểm.\r\n\r\nThiếu niên nhìn quanh căn phòng hắn đang nằm. Căn phòng không quá lớn, bày trí đơn giản, trong không khí mang thoang thoảng mùi thuốc, hẳn là đang ở một tiệm thuốc. Thiếu niên liền nằm xuống dưỡng thương rồi tiêu hóa một chút ký ức ở trong đầu.\r\n\r\n...\r\n\r\nHiện tại, cơ thể của người thiếu niên này đang cư ngụ một linh hồn, hay nói đúng hơn là linh hồn này đã dung hợp với linh hồn của người thiếu niên. Bản thân linh hồn này đời trước là một trong ngũ đại trưởng lão của Cửu Tiêu Tông – một vị Nguyên Anh sơ kỳ tu sĩ.\r\n\r\nCửu Tiêu Tông là một trong Thập đại chính phái ở Huyền Đô Đại Lục, Cửu Tiêu Tông có rất nhiều trưởng lão, hầu hết là từ Kim Đan cảnh trở lên, duy chỉ có ngũ đại trưởng lão là địa vị đặc thù. Ngũ đại trưởng lão chưởng quản Chấp Pháp điện, Công Thư lâu, Giới Ngục sơn, Đan Dược viện và Pháp Khí viện. Linh hồn này đời trước là trưởng lão chưởng quản Công Thư lâu – Phù Linh chân nhân.\r\n\r\nVài ngày trước, Phù Linh chân nhân thọ nguyên hao hết mà tọa hóa. Tin tức đã truyền đến cao tầng Đại Nguyệt Hoàng Triều, không bao lâu nữa sẽ đến Nguyệt Hải Thành. Phù Linh chân nhân vẫn lạc đem lại sự kinh động đến các môn phái khác.\r\n\r\nPhải biết Nguyên Anh tu sĩ là cấp bậc lão tổ ở tu chân giới, ít khi hiện thế nhân gian. Một vị vẫn lạc cũng đủ oanh động cả ngoại giới một đoạn thời gian.\r\n\r\nCòn thân thế của cơ thể này thì sao? Chủ nhân của cơ thế này là một tiểu nhị tại một kỹ viện ở Nam Thành Nguyệt Hải Thành. Xuất thân không rõ, từ nhỏ đã sống lang bạc, bị kẻ xấu lừa bán làm nô lệ, về sau được tú bà của kỹ viện mua lại làm tay chân phục vụ.\r\n\r\nNào có ngờ lại lọt vào mắt của đại nhân vật, số phận của thân thể này trực tiếp bị hãm hại và bị đẩy thành kỹ nam. Kể từ đó, kỹ viện bắt đầu có nữ nhân qua lại.\r\n\r\nĐố kỵ, ganh ghét, cạnh tranh ở kỹ viện ngày một lớn. Người thiếu niên này liền gặp phải ám toán rồi bị vứt bỏ trong con hẻm ở Bắc Thành\r\n\r\n...\r\n\r\nTiêu hóa một hồi sắc trời liền tối, lão nhân kia liền quay trở lại căn phòng, trên tay mang theo một chén cháo, nhìn thấy vị thiếu niên kia nằm trên giường, mắt hướng về trần nhà, ông lão cười nói:\r\n\r\n“Đại nhãn tử, trong người thấy thế nào?”\r\n\r\nĐại nhãn tử?\r\n\r\nThiếu niên nghe thấy liền kỳ lạ nhưng cũng nhanh mà chấp nhận. Đến tên của cơ thể này hắn còn không biết, lão nhân gọi sao cũng được. Thiếu niên gượng người dậy, lão nhân vội đặt chén cháo xuống rồi lại đỡ hắn. Sau đó lão kéo cái ghế đẩu lại mà ngồi\r\n\r\n“Đã ổn hơn nhiều rồi, đa tạ lão huynh đã cứu mạng”, thiếu niên đưa tay hành lễ đáp.\r\n\r\nDù kiếp trước tu vi thông thiên thế nào thì bây giờ hắn cũng chỉ là thường nhân, thiếu niên không thấy có gì mất mặt khi hành lễ cả.\r\n\r\n“Lão huynh?”\r\n\r\nNghe thấy hai chữ này, lão nhân liền cười ha hả, tay vỗ vào đùi liên tục.\r\n\r\n“Đại nhãn tử, lão già ta nhìn thế nào cũng ra dáng một kẻ gần đất xa trời rồi, ngươi gọi ta hai tiếng ‘lão huynh’, có khi nào bị người đánh đến chập mạch rồi không?”\r\n\r\nThiếu niên liền thất thố, quên rằng hiện giờ hắn chỉ mới mười lăm tuổi thôi, đối phương nhìn thế nào cũng ngoài bảy mươi rồi. Thiếu niên giả vờ ho khụ khụ bình ổn vài tiếng liền nghĩ:\r\n\r\n“Lão bá...”\r\n\r\n“Khoan đã”, lão nhân khoác tay\r\n\r\n“Trước ta kiểm tra thân thể ngươi một chút, những chuyện khác để nói sau”\r\n\r\nNghe vậy thiếu niên liền không nói gì nữa, ngoan ngoãn nằm xuống đưa tay ra cho lão nhân bắt mạch và kiểm tra thương thế. Lão kiểm tra cũng không được bao lâu, sau đó nói:\r\n\r\n“Mạch tượng ổn định, cơ thể không có vấn đề gì, tĩnh dưỡng vài ngày liền khỏi”\r\n\r\nNói xong câu này, một già một trẻ hai mắt nhìn nhau, không gian liền tĩnh lặng, ngoài trời gió nhẹ, tiếng cây đung đưa, một tiếng chim hót nhẹ rồi bay đi. Thiếu niên là người đầu tiên phá không gian tĩnh lặng này.\r\n\r\n“Lão bá, nơi đây là...”\r\n\r\n“Nơi đây là tiệm thuốc của lão già ta, gọi là Điền y quán, lão già ta tên là Điền Y”.\r\n\r\nLão nhân họ Điền nghĩ nghĩ một lát rồi nói tiếp:\r\n\r\n“Mặt khác, nếu ở ngoài ngươi nghe người khác gọi ta là Bạch gia thì cũng đừng ngạc nhiên. Họ của ta vốn không phải là Điền mà là Bạch, Bạch Y. Ngươi nhìn xem ta cả người có chỗ nào trắng, đành cải danh lại họ Điền”\r\n\r\nCải danh đổi họ đối với phàm nhân mà nói nếu không phải là trọng phạm thì bình thường không ai lại muốn làm thế. Phàm nhân khác tu sĩ, thọ nguyên của họ rất thấp, mục đích nhân sinh cũng khác hoàn toàn. Bởi vậy mới phải sinh con đẻ cái kéo dài hương hỏa.\r\n\r\nĐiền đại phu cả đời không vợ không con, lão không có ý định này liền đổi họ, nhà lão vốn ở một thôn nghèo, cha mẹ làm nghề nông, lão cố gắng một đời mới thành đại phu, ‘Điền Y’ – Bỏ ruộng hành y, cũng là một cái tên có ý nghĩa.\r\n\r\n“Đại nhãn tử, ngươi là ai?”, Điền đại phu hỏi\r\n\r\n“Lão bá, ta họ Khương, tên gọi là Hy”, thiếu niên cười đáp\r\n\r\nTrong ký ức của hắn kỳ thực không nói rõ thiếu niên này tên gì bởi chính thiếu niên này cũng không nhớ tên của mình, hắn liền lấy cái tên này.\r\n\r\nĐời trước hắn họ Khương, hắn từng tự nhủ nếu có hậu nhân hắn sẽ lấy cái tên này để đặt. Đáng tiếc, cuối cùng hắn vẫn là đơn thân mà chết. Hắn hy vọng cái tên này sẽ có tác dụng về sau. Mặt khác, đời trước hắn còn vài nhân quả chưa giải quyết được, vậy liền để đời này gánh đi. Từ nay về sau, hắn là Khương Hy.\r\n\r\nSau đó, hắn liền kể lại thân thế của mình cho Điền đại phu, ngoại trừ thân phận Phù Linh kiếp trước, còn lại hắn tuyệt không giấu gì, bao gồm thân phận kỹ nam. Trong ký ức, hắn liền biết đây là Nguyệt Hải Thành, là một tòa đại thành của Đại Nguyệt Hoàng Triều, tòa thành này cực lớn nhưng nếu Điền đại phu muốn tra cũng không phải không tìm ra. Nghe xong, ông lão liền thở dài lắc đầu.\r\n\r\n“Hài tử đáng thương, lão già ta những năm này chỉ quanh quẩn ở Bắc Thành, nhưng cũng có nghe nói qua tiểu kỹ nam ở Nam Thành, danh khí của ngươi không lớn nhưng cũng không nhỏ đâu”\r\n\r\nKhương Hy nghe vậy cũng khá ngạc nhiên, không nghĩ tới lại có tiếng đến thế. Hắn liền nhíu mày, tiếng càng lớn thì càng phiền, nhỡ bị người bắt gặp thì sao đây. Hiện tại hắn còn chưa có thực lực để thoát khỏi đó. Dường như biết hắn đang nghĩ gì, Điền đại phu liền mở miệng\r\n\r\n“Đại nhãn tử, ngươi muốn ở lại đây không? Lão già ta giúp ngươi chuyện bên kia. Ít nhiều gì lão già ta cũng từng chữa trị cho người bên đó... họ có lẽ vẫn bán chút mặt mũi cho lão già này.”\r\n\r\n“Lão bá, người nói chuyện này là thật”, Khương Hy có chút ngạc nhiên, thầm vui mừng nhưng liền trầm lại, trên đời này không có bữa cơm miễn phí, rốt cuộc Điền đại phu muốn làm gì?\r\n\r\n“Đương nhiên là thật, nhưng đại nhãn tử ngươi cũng không phải ở không, lão già ta cũng lớn tuổi rồi, tay chân không còn như trước. Ngươi ở lại đây phụ ta, ta cũng có thể truyền nghề cho ngươi. Cơm nước ngươi không cần quản, đến giờ chỉ cần qua quán ăn của Tứ nương bên đường liền được”, Điền đại phu nghiêm túc nói.\r\n\r\nKhương Hy trầm mặc, một lát sau mở miệng:\r\n\r\n“Lão bá, ta chấp nhận, người để ta ở đây đi”.\r\n\r\nTrước mắt hắn cần một chỗ ở, còn những chuyện vặt kia tuy đã rất lâu rồi không dùng nhưng hắn sẽ quen nhanh thôi. Quan trọng là chuyện phiền phức kia liền có người giải quyết.\r\n\r\n“Được rồi, người ăn chút cháo rồi nghỉ ngơi, vài ngày sau liền bắt đầu”\r\n\r\nĐiền đại phu gật đầu rồi mang chén cháo cho Khương Hy rồi đóng cửa ra khỏi phòng. Hắn nhìn chén cháo đã có chút nguội trong tay, cháo hoa thịt bò, hẳn là ở chỗ Tứ nương trong miệng Điền đại phu.\r\n\r\nKhác với gương mặt vui vẻ non nớt vừa rồi, bây giờ Khương Hy trông trầm ổn hơn hồi nãy nhiều, ánh mắt to không còn sáng như trước mà thay vào đó là thâm trầm hờ hững tĩnh lặng như mặt hồ không gợn sóng. Nếu Điền đại phu quay lại nhìn thì sẽ cảm nhận được, Khương Hy lúc trước và bây giờ hoàn toàn là hai người khác nhau.\r\n\r\nTrầm mặc một đoạn thời gian, hắn thì thào:\r\n\r\n“Cháo hoa a, ngàn năm rồi....”\r\n\r\nKhương Hy ngẩng đầu nhìn về ô cửa sổ, ngoài trời là một màn đêm tĩnh lặng, trên trời treo một vầng trăng sáng, phản chiếu vào mắt hắn tựa như vầng trăng trong mặt hồ tĩnh lặng. Trăng trong hồ, huyền ảo không thể bắt, hắn liền nghĩ con đường sau này nên đi ra sao đây.', 2, 6),
(13, 'Mở đầu câu truyện', 'Giới thiệu nam chính nữ chính đáng yêu , đẹp trai , xinh gái', 1, 7),
(14, 'KẾT HÔN VỚI ÔNG CHỒNG THỰC VẬT', 'Tô Hiểu Mộng bị người em gái kế độc ác hãm hại, rơi xuống từ tòa nhà cao tầng và qua đời. Nhưng khi tỉnh lại, cô phát hiện mình đã trọng sinh về đêm xảy ra bi kịch đó.Để thay đổi số phận, cô quyết định thay thế người em gái độc ác gả cho vị đại lão tài phiệt đang trong trạng thái thực vật.Mọi người đều cho rằng Tô Hiểu Mộng sẽ phải sống cả đời bên cạnh một \"người chết biết thở\" và chờ xem cô trở thành trò cười.Kết quả, ngay trong đêm tân hôn, người chồng tài phiệt đẹp trai tuyệt mỹ của cô… mở mắt ra!', 2, 7),
(15, 'Bắc thành thần ', 'Nguyệt Hải Thành.\r\n\r\nMùa đông vừa qua, ánh sáng ấm áp của mùa xuân đang tới dần. Tuy rằng tuyết mùa đông vẫn chưa tan hoàn toàn nhưng khung cảnh vẫn khiến người người cảm nhận được tân sinh.\r\n\r\nTại một ngã tư đông đúc nào đó, một lão nhân đang nắm tay một tiểu cô nương đứng trước cửa tiệm thuốc của Điền đại phu, cả hai đang đứng nhìn biển hiệu, theo một nghĩa nào đó mà nói, rất đăm chiêu.\r\n\r\nLão nhân mang trường bào cũ màu xanh lam đã có chút bạc màu, tóc tai lộn xộn. Tiểu cô nương mang phục trang màu hồng nhạt, mái tóc ngắn được chải gọn gàng thả ra sau. Hai người tạo thành một tổ hợp kỳ quái, như thái cực đối lập với nhau vậy. Người qua đường không để ý đến họ, dường như đã quen thuộc với hình ảnh như vậy rồi.\r\n\r\nNhìn biển hiệu một chút, lão nhân mới dắt tiểu cô nương vào.\r\n\r\n\"Điền đại phu, phiền ngài xem bệnh giúp cháu gái của ta\", ông lão nói\r\n\r\nGương mặt lão có vẻ tiều tụy kết hợp với chòm râu cá trê khiến người của lão trông nặng nề hơn. Tiểu cô nương bên cạnh trông dáng vẻ tầm mười tuổi, nét mặt trắng bệch, đôi mắt lờ đờ, trông như bất cứ lúc nào cũng có thể sụp đổ vậy.\r\n\r\n\"Lão Hoàng, tiểu Linh làm sao thế?\"\r\n\r\nĐiền đại phu đang đứng ở sau quầy kiểm kê, thấy cặp ông cháu này liền hoảng hốt, vội chạy đến hỏi.\r\n\r\n“Ài, ta không biết, mấy vị đại phu khác không chẩn đoán được”, lão nhân chán nản nói, đồng thời mang theo ánh mắt chờ mong nhìn Điền đại phu rồi lại nhìn sang cháu gái một cách lo lắng.\r\n\r\nĐiền đại phu không nhiều lời liền gật đầu, dắt tiểu cô nương gọi tiểu Linh đến chiếc giường ở sát trong tường.\r\n\r\nTiệm thuốc của Điền đại phu tương đối lớn, từ ngoài cửa nhìn vào, ở bên trái là quầy thuốc phổ thông với nhiều hộc thuốc được xếp tầng đều đặn. Bên phải đặc biệt hơn, chỉ có một vài loại dược liệu được đặt gọn gàng trong hộp gỗ, mỗi hộp gỗ được đặt cách nhau một hoặc hai gang tay trên những cái bàn.\r\n\r\nNhững hộp gỗ đó chứa linh dược, người thường mua không nổi.\r\n\r\nĐằng sau hai quầy thuốc là nơi đặt giường bệnh, lúc này, tiểu Linh đã an vị trên giường. Điền đại phu bắt đầu bắt mạch. Một lát sau, Điền đại phu liền nhíu mày, vẻ mặt càng lúc càng khó coi, lão quay sang mắng lão nhân râu cá trê:\r\n\r\n\"Lão thất phu, dám lừa ta!!!\"\r\n\r\nĐiền đại phu cũng tiện tay mà ném luôn cốc nước mà Khương Hy vừa mang ra về hướng ông lão cá trê.\r\n\r\nLão nhân kia thấy thế liền né sang một bên, dáng vẻ nhanh nhẹn khác hẳn vẻ nặng nề ban nãy, vẻ mặt tiều tụy giờ không còn thay vào đó là cao hứng khoái trá nhìn Điền đại phu, đưa tay vuốt chòm râu cá trê của mình. Khương Hy thấy lão nhân này trông thật hèn mọn, lão nhân cười ha hả nói:\r\n\r\n\"Thế nào, lão phu không lụt nghề chứ\"\r\n\r\n\"Hừ\"\r\n\r\nĐiền đại phu bực tức không nhìn lão nhân hèn mọn kia, quay sang nhìn tiểu Linh trên giường, ý nói còn con thì sao. Tiểu cô nương đã không còn nằm nữa mà ngồi dậy cười hì hì, lanh lợi bảo:\r\n\r\n\"Điền gia gia đừng giận tiểu Linh mà\"\r\n\r\nTiểu cô nương còn nhõng nhẽo nói thêm:\r\n\r\n\"Gia gia bảo nếu lừa được Điền gia gia liền đưa tiểu Linh đi ăn Mỳ Bắc Thành của Tứ nương\"\r\n\r\nLão Hoàng nghe vậy nụ cười trên mặt liền khựng lại, thầm nghĩ ta hứa hồi nào, ranh con, nhỏ tuổi mà đã dám lừa ta.\r\n\r\nĐiền Đại phu không thèm nhìn hai ông cháu này, đứng dậy trở về quầy. Khương Hy liền dọn dẹp cốc nước đáng thương vừa bị ném đi, tiểu Linh định xuống giường giúp đỡ liền bị ngăn lại. Khương Hy cươi nói:\r\n\r\n\"Tiểu Linh, muội bị cảm nhẹ nên nghỉ ngơi, để ta dọn cho\"\r\n\r\nTừ góc quầy đang lấy thuốc, giọng Điền đại phu vang ra:\r\n\r\n\"Đại nhãn tử nói đúng đấy, con nên nằm nghỉ đi\"\r\n\r\nĐiền Y thầm ngạc nhiên, không khỏi nhìn về phía Khương Hy. Tên tiểu tử này không bắt mạch liền nhìn ra bệnh, thầm nghĩ kỳ quái. Lão Điền trong lúc đang suy nghĩ thì Khương Hy đã dọn dẹp xong, đang ngồi nói chuyện phiếm với lão Hoàng.\r\n\r\n...\r\n\r\nLão Hoàng là một nghệ nhân kịch nói ở Nguyệt Hải Thành, hành nghề đã có hơn bốn mươi năm. Lão không xưng tên mình, lão bảo tên lão rất xấu, chỉ đem lại toàn xúi quẩy nên chán ghét vô cùng. Vậy nên mọi người đều gọi lão là lão Hoàng.\r\n\r\nHoàng gia ba đời đều làm nghệ nhân kịch nói, đến đời tiểu Linh liền là đời thứ tư. Ở Bắc Thành lão Hoàng nổi tiếng lừa gạt, hèn mọn vô cùng, không ít người đã bị lão lừa. Dân chúng quanh đây quen với điệu bộ này của lão liền không nói gì, dù sao lão cũng chưa từng gây ra chuyện gì lớn. Xui xẻo liền ở mấy con gà non lần đầu đến Bắc Thành, đương nhiên trừ Khương Hy ra.\r\n\r\nLại nói về Khương Hy, từ lúc được Điền đại phu mang về đến nay đã được một tháng. Thương thế trên người hắn đã khỏi, hắn phụ giúp Điền đại phu sắp xếp dược liệu, phơi khô, nghiền dược, quét tước nhà cửa, thi thoảng trông coi tiệm thuốc khi Điền đại phu đi vắng. Nhìn chung mà nói, hắn không có điểm gì giống với lão bất tử sống hơn ngàn năm cả. Ngược lại còn giống một người giúp việc hơn.\r\n\r\nNgoài ra, Khương Hy cũng được Điền đại phu chỉ dạy về y thuật và bốc thuốc. Hắn học rất nhanh, không đến một tuần lễ liền có thể bắt mạch, bốc thuốc. Điền đại phu mặt như nằm mơ, thầm nghĩ:\r\n\r\n“Lão già ta nhặt được bảo?”\r\n\r\nThành thật mà nói, Khương Hy có thể làm được ngay sau khi lão nói, có điều làm thế thì quá dọa người. Điền đại phu cũng lớn tuổi rồi, e rằng không chịu nổi kích thích lớn như thế. Nhưng để đạt độ thành thạo như hiện tại hắn đương nhiên phải bỏ thời gian luyện tập đôi chút.\r\n\r\nĐối với Nguyên Anh lão tổ thì nghe rất lạ nhưng thực tế cơ thể của hắn không nghe theo bộ não chút nào, cơ thể này không phải của hắn. Hiện tại hắn đang trong tình trạng nhận thức và thân thể không tương xứng về mặt cấp độ. Có nhiều việc hắn biết nhưng không thể làm được, cách giải quyết duy nhất là hắn phải khôi phục lại tu vi.\r\n\r\nSau đó, Điền đại phu liền giao việc bảo quản dược liệu lại cho Khương Hy. Hiển nhiên những dược liệu này liền là phàm dược, linh dược lão vẫn tự tay bảo quản.\r\n\r\nTrong những ngày chỉ dạy Khương Hy, Điền đại phu đại khái đã hiểu con người hắn, là một đứa trẻ ngoan, hay ít nhất là Khương Hy muốn cho lão thấy như vậy.\r\n\r\nĐiền y quán của Điền đại phu tương đối có danh khí ở Bắc Thành bởi tài nghệ của lão. Không phải tiệm thuốc nào cũng được quyền bán linh dược, trong tình huống bình thường bán linh dược thường là do tiệm dược của các thế gia mở ra, ngoài ra còn phải có đan sư bảo đảm.\r\n\r\nThế gia đương nhiên là tu chân thế gia, còn Điền Y không phải thế gia, cũng không phải đan sư, càng không phải tu sĩ. Chỉ nghe thế gian đồn rằng y thuật của Điền đại phu có thể cứu mạng một vị Luyện Khí hậu kỳ.\r\n\r\nTu chân cảnh giới đầu tiên Luyện Khí kỳ gồm mười tầng, tầng một đến ba là sơ kỳ, bốn đến sáu là trung kỳ, bảy đến chín là hậu kỳ, mười là đỉnh phong. Luyện Khí sơ kỳ chỉ mạnh hơn người thường một chút, cơ thể vẫn có thể bị nhiễm bệnh. Tu vi đến Luyện Khí trung kỳ thực lực có thể xưng là ngang ngửa với võ lâm cao thủ. Hậu kỳ liền ngang với cao nhân võ lâm tiền bối, cơ thể không bị nhiễm bệnh, nếu cần y sư thì cũng là trúng kịch độc hoặc gặp phải vết thương chí mạng.\r\n\r\nỞ nhân gian, thủ đoạn của Điền đại phu thông thần, liền có thể xưng hai chữ Thần Y. Chưa kể đằng sau Điền đại phu là một đại nhân vật. Khương Hy lần đầu nghe cũng có chút bất ngờ về thủ đoạn của Điền đại phu, đồng thời cũng tò mò về đại nhân vật sau lưng. Ở với Điền đại phu mấy ngày nay, hắn ít nhất có thể xác định lão nhân này độc thân, không thân không thích, bỗng nhiên từ đâu lại tồn tại một đại nhân vật.\r\n\r\nĐại nhân vật ở đây cũng rất có ý vị, Điền đại phu bán linh dược tất đang cướp khách của mấy tiệm dược thế gia. Giữa một tiệm dược thế gia cao sang và một tiệm dược bình dân mà cùng bán một loại linh dược, dân chúng mua ở đâu sẽ dễ hơn?\r\n\r\nKhương Hy lo lắng Điền đại phu sẽ bị cuốn vào tranh đấu giữa các tu sĩ, hắn lo lão chỉ là quân cờ được đẩy ra đầu ngọn gió.\r\n\r\nThấy Khương Hy đăm chiêu, lão Hoàng đắc ý, tay vuốt chòm râu cười nói:\r\n\r\n\"Đại nhãn tử ngươi biết đại nhân vật là ai không?\"\r\n\r\nLão già hèn mọn này mặc dù biết tên Khương Hy nhưng vẫn học theo Điền đại phu gọi Đại nhãn tử. Cá nhân hắn thì không quan tâm lắm, chỉ là một cái tên gọi mà thôi.\r\n\r\n\"Theo lời lão bá... hẳn là thành chủ đi\", hắn cười nói\r\n\r\nMấy lời này đương nhiên là nói đùa, Nguyệt Hải Thành chủ hắn chưa từng gặp nhưng ít nhất biết tu vi của vị này, lão Điền còn chưa đủ tuổi làm tôn tử cho vị này. Hơn nữa, thành chủ không cần phải dùng lão Điền làm con cờ.\r\n\r\nTheo hắn suy đoán, đại nhân vật chắc chắn là tu sĩ và địa vị phải rất cao. Hắn không hiểu quá rõ về cách cục thế lực ở tòa thành này nhưng ít nhất đại nhân vật kia đủ lực để chống lại tu chân thế gia.\r\n\r\nLão Hoàng lắc đầu sau đó lại gật đầu nói:\r\n\r\n\"Không phải thành chủ nhưng cũng có liên quan, là... cháu trai của thành chủ\"\r\n\r\nSau đó lão nói tiếp:\r\n\r\n\"Hơn hai mươi năm trước, lão Điền cứu vị kia một mạng, sau vị đó thành tựu Trúc Cơ liền chống lưng cho lão, Bắc Thành ai dám không nể mặt lão chứ\"\r\n\r\nNăm đó, vị kia bị cường địch truy sát. Một đường bị đuổi giết, may mắn chạy kịp về Nguyệt Hải Thành nhưng một thân thương thế vô cùng trầm trọng. Vị kia liền ngất, Điền đại phu trong khoảng thời gian đó đang ở ngoại thành hái dược, vô tình bắt gặp được. Nhận ra thành huy trên phục trang, Điền đại phu liền cứu hắn. Mấu chốt là Điền đại phu không đưa về thành chữa trị và là chữa trị tại chỗ.\r\n\r\nNgày hôm đó không ai chứng kiến được.\r\n\r\n...\r\n\r\nKhương Hy nhớ lại vài ngày trước, Điền đại phu giúp hắn giải quyết phiền phức kia, kết quả đúng là đã giải quyết được, hắn được trả tự do. Lúc đó hắn không nghĩ gì nhiều, cho rằng mặt mũi lão Điền quả nhiên lớn, không nghĩ lớn đến dạng này.\r\n\r\n“Phủ thành chủ, vua một đất a. Hi vọng tên cháu trai kia không dùng Điền đại phu như quân cờ. Nếu không...”, Khương Hy thầm nghĩ\r\n\r\nHắn trầm ngâm suy ngẫm, bỗng nhiên một tiếng bộp vang lên, hắn giật mình. Điền đại phu mang thuốc được gói cẩn thận để trước mặt lão Hoàng, nói:\r\n\r\n\"Bớt nói nhảm, mang thuốc về nhớ sắc cho tiểu Linh uống\"\r\n\r\nNói xong, ánh mắt Điền đại phu liền liếc qua tiểu Linh, nói tiếp:\r\n\r\n\"Đừng quên dẫn tiểu Linh ăn Mỳ của Tứ nương\"\r\n\r\nMặt lão Hoàng liền đen lại, thầm mắng trong lòng:\r\n\r\n“Được lắm, hai người bắt nạt lão phu”.\r\n\r\nLão Hoàng đảo mắt qua nhìn Khương Hy, thầm nghĩ:\r\n\r\n“Tên tiểu tử này... chưa hề bắt nạt ta, còn rất lễ phép”.\r\n\r\nLão Hoàng lại nhìn Điền đại phu, lão liền lắc đầu, hi vọng không bị lão Điền lây xấu, cầm gói thuốc trong tay dắt tiểu Linh ra về, trước lúc ra về con nhắc nhở Khương Hy\r\n\r\n\"Đại nhãn tử... bảo trọng\"\r\n\r\nKhương Hy thật khó hiểu lão già này, thật thật giả giả, còn định trang bức ai đây. Quay sang thấy Điền đại phu đang nhìn hắn. Lão nói ra:\r\n\r\n\"Đại nhãn tử, ngươi muốn học Y thuật không?\"\r\n\r\nTrong lúc gói thuốc, Điền đại phu quyết định sẽ truyền nghề cho Khương Hy, theo lão, hắn có thiên phú về mặt này, hơn nữa lại vô cùng cao. Về mặt nhân phẩm mà nói, đạo lý ‘lương y như từ mẫu’ đối với y sư rất quan trọng, đương nhiên lão không thể qua loa mà lão đã tự thân kiểm chứng. Khương Hy vốn đã được thông quan rồi.\r\n\r\n“Lão bá, không phải ngài đã dạy ta rồi sao”, Khương Hy đáp\r\n\r\n“Ta nói, là chân chính y thuật, không phải mấy trò vặt vãnh của lang băm kia”, Điền đại phu nói\r\n\r\nKhương Hy nhìn ông lão chân hơi khụy trước mặt, ánh mắt chờ mong nhìn hắn. Khương Hy suy ngẫm một hồi liền cúi người xuống ngang lão, cười nói:\r\n\r\n\"Được Thần Y đại nhân chỉ dạy, Khương Hy cầu còn không được\"\r\n\r\nĐiền đại phu mặt liền đen lại, mắng hắn:\r\n\r\n\"Chớ có nghe lão thất phu kia nói bừa\"\r\n\r\nĐiền đại phu quay người đi lại vào quầy. Khương Hy nhìn theo bóng lưng lão, ánh mắt lộ ra nét tang thương thầm lặng nhưng chớp mắt liền biến mất. Hắn quay ra nhìn trời, ánh mặt trời lên đỉnh tỏa ra quang minh chói lòa nhưng lại ấm áp ở vào đầu xuân, hắn không tự chủ đưa tay lên che. Chợt, tay còn lại đưa lên bụng, mắt di chuyển về hướng bên kia đường, bên đó có một quán ăn tấp nập người người ra vào.\r\n\r\n“Ta đói rồi sao”, Khương Hy thầm nghĩ.', 3, 6),
(16, 'Nguyệt hải thành', 'Đói bụng, với phàm nhân là bình thường, với Khương Hy thì có chút lạ. Một ngàn năm rồi hắn chưa từng ăn gì khác ngoài đan dược, càng không có đói bụng. Từ khi đột phá Trúc Cơ hắn liền ích cốc, việc ăn uống từ đó đã không còn quan trọng nữa.\r\n\r\nĐến nay cảm giác lại một lần nữa, Khương Hy có chút suýt xoa tự nhủ:\r\n\r\n\"Thương hải tang điền a, không biết mấy lão già kia biết tin ta tọa hóa có cảm thụ ra sao đây\".\r\n\r\nNgẫm một hồi Khương Hy liền thở dài, ôm bụng đói quay vào gặp Điền đại phu:\r\n\r\n\"Lão bá, ta qua chỗ Tứ nương ăn\"\r\n\r\nĐiền đại phu nghe vậy liền thò vào tay áo lấy ra một túi bạc ném cho hắn, nói:\r\n\r\n\"Cầm lấy, chiều nay lão già ta có việc, tiệm thuốc đóng cửa, cũng một tháng rồi không ra ngoài, ngươi cũng nên tìm hiểu một chút cuộc sống ở Bắc Thành đi\"\r\n\r\nĐiền đại phu nói xong liền phất tay đuổi người. Cầm lấy túi bạc trong tay, Khương Hy cười nói:\r\n\r\n\"Đa tạ lão bá\"\r\n\r\nHắn di chuyển về phía cửa, trước khi đi không quên đem biển hiệu vào nhà cất. Thu dọn xong liền di chuyển qua chỗ Tứ nương.\r\n\r\nTứ nương là một phụ nhân trung niên, tuy đã có tuổi nhưng nàng trông chỉ như cuối độ tuổi hai mươi mà thôi. Dung mạo Tứ nương khá bình thường nhưng với người đã nhìn thấy nàng liền khó quên. Điểm đặc biệt mà Tứ nương có là khóe miệng của nàng, mỗi lần nàng cười, khóe miệng của nàng như được thổi hồn vậy.\r\n\r\nMặt khác Tứ nương là một người rất dễ nói chuyện nhưng tính cách nàng... lại đặc biệt nóng. Có hôm Khương Hy ra ăn trễ liền bị Tứ nương rầy mắng đại nhãn tử ngươi tuổi còn đang lớn, không ăn đúng giờ sao được. Mắng một hồi liền mắng lây qua lão Điền bóc lột sức trẻ nhỏ, già mà không kính các loại.\r\n\r\nKhương Hy vào quán thấy Tứ nương đang loay hoay chuẩn bị, nàng vốn không thích có người đứng cùng bếp nên hầu như mọi việc nàng đều tự làm. Hắn suy nghĩ một hồi vẫn quyết định lại giúp. Tứ nương thấy hắn liền bảo:\r\n\r\n\"Đại nhãn tử đến rồi đấy à, lại ngồi đi\"\r\n\r\n\"Tứ nương, hôm nay thật đông khách\", Khương Hy đáp.\r\n\r\nHắn nhìn quanh quán ăn, hôm nay quả thật rất đông, ngay cả hắn cũng không có chỗ để ngồi đây.\r\n\r\n\"Tứ nương cũng không biết, Đại nhãn tử ăn gì đây?\", Tứ nương lắc đầu, quay sang hỏi, tay vẫn không ngừng xắt hành, dáng vẻ rất thành thạo, hành xắt rất đều.\r\n\r\nKhương Hy suy nghĩ một hồi, nhìn quanh xem thử mọi người ăn gì, chợt nhớ đến tiểu Linh lúc sáng. Hắn cười nói:\r\n\r\n\"Tứ nương, cho ta bát Mỳ Bắc Thành\"\r\n\r\n\"Được, đợi một lát Tứ nương làm cho ngươi\", Tứ nương cười nói, khóe miệng hiện ra.\r\n\r\nTứ nương là một quả phụ, phu quân vốn là một ngư dân, không may thay mười năm trước đã gặp nạn ngoài biển. Gốc gác mà nói, Tứ nương vốn sống ở Đông Thành, sau khi phu quân qua đời, nàng liền chuyển đến về Bắc Thành, mở một quán ăn nhỏ.\r\n\r\nQuán ăn của Tứ nương rất có danh khí, không kém mấy quán ăn lớn nổi danh chút nào, hằng ngày người ra người vào tấp nập. Tứ nương nổi tiếng với trù nghệ cao, khắp Bắc Thành không đối thủ. Nhiều lần nhận được lời mời từ các quán ăn lớn, Tứ nương vẫn nhã nhặn từ chối, một mực chấp nhất với quán ăn của mình.\r\n\r\nKhương Hy đứng đợi một hồi liền thấy một nhóm người vừa ăn xong, đứng dậy trả tiền, hằn liền nhảy vào ngồi. Trong thời gian một tháng, hắn học được một điều ở quán Tứ nương, đó là \"không nhanh liền mất quyền lợi\". Hôm nay đông khách, lại càng phải nhanh.\r\n\r\nMột lát sau, Tứ nương mang bát mỳ ra. Mùi hương liền lan tỏa hết cả quán, mọi người đều không tự chủ mà nhắm mắt, khứu giác tự động ngửi mùi hương. Mỳ Bắc Thành, danh xứng với thực, toàn Bắc Thành không bát mỳ nào vượt qua nổi bát mỳ đang hiện hữu trước mặt Khương Hy.\r\n\r\nSợi mỳ dài trắng mà không nát, nước dùng trong vắt có thể thấy đáy. Trái ngược với hình thức thì mùi hương của nó lại mãnh liệt vô cùng. Ở trên còn có thịt và rau củ ngâm được xếp ngay ngắn, Tứ nương còn rắc thêm hành xắt lúc nãy vào. Bát mỳ lúc này trông như kỳ trân dị bảo, Khương Hy thật không nỡ ăn nhưng dạ dày liền thúc dục hắn quá rồi. Hắn ngẩng đầu lên nhìn Tứ nương, cười nói:\r\n\r\n\"Đa tạ Tứ nương, ta sẽ ăn ngon\"\r\n\r\n\"Được rồi, Đại nhãn tử ăn ngon, Tứ nương làm việc tiếp\", Tứ nương cười đáp, sau liền quay lại bếp.\r\n\r\nKhương Hy liền bắt tay vào ăn, sợi mì dai vừa miệng, thịt thật mềm, thật thơm. Miếng thịt khi vào miệng hắn lập tức tan chảy ra, mùi vị bắt đầu thấm nhuần vào khoang miệng như một bước dạo đầu. Hắn bê tô lên húp một chút nước dùng, là nước dùng đậm đà của sò điệp. Hương vị liền lan tỏa đến khắp ngóc ngách trên người hắn. Khương Hy ngạc nhiên.\r\n\r\n\"Không phải ta đang ăn linh thực chứ?\"\r\n\r\nLinh thực là thực phẩm dành cho người tu hành, nhất là giai đoạn Luyện Khí. Linh thực dùng linh khí để nuôi trồng ra, giá trị liên thành. Tương tự như linh dược, linh thực không thể bán loạn. Phủ thành chủ và thế gia kiểm soát loại mặt hàng này rất kỹ.\r\n\r\nDù không làm từ linh thực, nhưng Mỳ Bắc Thành quả thực rất ngon. Bắc Thành đệ nhất Mỳ, không sai chút nào.\r\n\r\nTrong lúc Khương Hy đang ăn, người vào quán ngày càng đông. Trong quán đã không còn bàn trống, khách nhân liền xếp hàng chờ đợi. Trong lúc mọi người đợi liền tám chuyện với đồng bạn\r\n\r\n\"Huynh đệ đã biết chuyện gì chưa?\"\r\n\r\n\"Lão ca, có chuyện gì nữa rồi?\"\r\n\r\n\"Nghe nói vài tháng trước có tiên nhân tọa hóa rồi\"\r\n\r\nLời vừa ra, mọi người trong quán liền đình chỉ hoạt động lại, ánh mắt đều dồn về hướng thanh niên đang nói. Khương Hy cũng đình chỉ, chỉ là hắn đình chỉ sớm hơn những người khác mà thôi, thầm nghĩ xem ra tin tức cũng đã truyền đến đây rồi.\r\n\r\nThanh niên bị mọi người nhìn đến có chút lúng túng, Tứ nương còn nhìn hắn với con dao ở trong tay. Ở Huyền Đô Đại Lục, tiên nhân đáng được kính trọng, ngươi dám sỉ nhục tiên nhân, mọi người liền đập chết ngươi. Thanh niên liền cuống lên, đưa ba ngón tay lên thề:\r\n\r\n\"Ta nói thật, tin tức này ta nghe từ Đô đại nhân ở Phủ Thành chủ\"\r\n\r\nNghe đến Phủ Thành chủ mọi người liền thôi không nhìn hắn nữa. Ở Nguyệt Hải Thành, phủ Thành chủ là một cụm từ rất nặng, Thành chủ là cây định hải thần châm của Nguyệt Hải Thành.\r\n\r\nTrong ý nghĩ của mọi người, tiên nhân gì đó trong miệng khách nhân cũng không bằng vị Thành chủ đại nhân kia, dù sao với phàm nhân, biết bay liên nhân, ở phủ Thành chủ còn có một đội quân biết bay nữa kia. Một số người tò mò liền đợi để nghe tiếp, thanh niên thấy vậy liền tiếp tục:\r\n\r\n\"Đô đại nhân nói, tiên nhân kia địa vị rất cao... nghe bảo sống còn lâu hơn cả Thành chủ đại nhân\".\r\n\r\n\"Cái gì cơ, sống lâu hơn cả vị kia sao?\", mọi nguồ chấn kinh.\r\n\r\n\"Thật, nghe nói Thành chủ còn cảm thán... gọi là tiền bối nữa cơ\"\r\n\r\n\"Này vị huynh đệ, ngươi không nói xạo đó chứ?\"\r\n\r\nMột khách nhân không tin mà nói ra. Vị khách nhân này một nhà ba thế hệ đều sống ở Nguyệt Hải Thành, từ thế hệ đầu đến giờ đều chỉ có duy nhất một vị Thành chủ. Chưa hề có một sự kiện truyền vị hay thay đổi nào cả. Trong mắt khách nhân này, Thành chủ đại nhân chính là trường sinh bất tử, hắn không tin cũng là lẽ đương nhiên.\r\n\r\n\"Ta đương nhiên là nói thật, hơn nữa...\"\r\n\r\n\"Hơn nữa cái gì, nói mau\", có người nóng nảy thúc giục.\r\n\r\n\"Hơn nữa Đô đại nhân bảo vị tiên nhân kia sống đã hơn ngàn năm. Trời ạ, là ngàn năm đấy\"\r\n\r\nMọi người trong quán liền trầm trồ, sống hơn ngàn năm, nhà họ kéo dài đến hai mươi đời còn không dài đến thế. Có người liền cảm khái tiên nhân quả là tiên nhân, có người tiếc nuối vì vị tiên nhân kia đã tọa hóa rồi. Thậm chí có người còn kinh sợ mà nghĩ thầm:\r\n\r\n\"Sống hơn ngàn năm... sẽ không phải là yêu quái chứ?\"\r\n\r\nNhững lời này đương nhiên sẽ không nói ra, như thế gọi là xúc phạm tiên nhân. Tiên nhân cao cao tại thượng, phàm nhân không thể hiểu, cũng không thể chạm vào được.\r\n\r\nKhương Hy ngồi ngay đó cũng không nghe nữa, tiếp tục ăn bát mỳ, lòng cảm khái:\r\n\r\n\"Ngàn năm hóa bụi đất vàng a, tiếc thay \"lão phu\" còn chưa đến mức đó\".\r\n\r\n...\r\n\r\nBuổi chiều, Khương Hy đi dạo quanh Bắc Thành. Nguyệt Hải Thành quả không hỗ là một trong các đại thành của Đại Nguyệt Hoàng Triều, tòa thành này to hơn nhiều so với tưởng tượng.\r\n\r\nNhân số của Nguyệt Hải Thành là hai trăm vạn người, nếu tính luôn cả thương nhân lẫn khách vãng lai thì con số có thể lên đến hai trăm năm mươi vạn người. Nguyệt Hải Thành chia làm năm khu vực, lần lượt là Đông, Tây, Nam, Bắc và Trung ương.\r\n\r\nĐầu tiên là Đông Thành, Đông Thành nằm ở vị thế tương đối đặc thù so với bốn khu vực còn lại, nó nằm ngay trên biển. Đông Thành rất lớn, chiếm 4 phần diện tích của Nguyệt Hải Thành, chức năng cũng quan trọng nhất, đó là quản lý thương cảng. Hải cảng của Nguyệt Hải Thành phi thường có danh khí, hằng năm đóng góp kim ngạch cho Đại Nguyệt Hoàng Triều không ít. Hải cảng nơi đây giúp hàng hóa được lưu thông thuận lợi hơn. Nguyệt Hải Thành giao thương với rất nhiều nơi, bao gồm cả đại lục khác. Ngoài cảng có rất nhiều tàu thuyền neo đỗ, địa thế của Bắc Thành rất cao, Khương Hy có thể thấy được ngoài cảng có linh thuyền.\r\n\r\nLinh thuyền là một loại di chuyển pháp khí có tác dụng phòng ngự mạnh, ngoài trừ điều đó ra linh thuyền không khác thuyền bình thường là bao nhiêu. Tác dụng phòng ngự chủ yếu là để chống yêu thú và hải tặc. Tu vi cao thì trực tiếp phi hành mà đi, tuy nhiên để di chuyển từ đại lục ra hải đảo gần nhất ít nhất cũng là Kim Đan cảnh tu vi. Tu vi chưa đến đó thì ngoan ngoãn trả tiền mà đi Linh thuyền thôi.\r\n\r\nBắc Thành là nơi có địa thế cao nhất ở Nguyệt Hải Thành. Và người sống ở đây chủ yếu là phàm nhân. Bắc Thành không giàu có nhưng cũng không đến mức gọi là nghèo. Ít nhất Khương Hy chưa thấy ăn xin nào xuất hiện ở Bắc Thành.\r\n\r\nThêm vào đó, Bắc Thành có Nguyệt Hải tam nhân, đều là kỳ nhân ở lĩnh vực của họ. Riêng điều này Khương Hy chưa bao giờ để tâm là bao, bởi vì hắn đã từng gặp hết cả ba.\r\n\r\nThần Y Điền đại phu.\r\n\r\nThần Trù Tứ nương.\r\n\r\nThần Kịch lão Hoàng.\r\n\r\nNam Thành thì khác. Nam Thành vô cùng giàu, giàu đến dọa người. Ở Nam Thành, dù có ai lỡ làm rơi tiền cũng không ai muốn lấy, ở đây không thiếu nhất chính là tiền. Nam Thành cũng nơi vui chơi của các tầng lớp, đồng thời cũng là nơi đãi khách của Phủ Thành chủ.\r\n\r\nTây Thành diện tích tương đối nhỏ nhưng địa vị cực cao. Nếu Bắc Thành tập trung phàm nhân, thì Tây Thành là nơi của người tu hành. Toàn bộ người tu hành sẽ ở đây, đương nhiên Nguyệt Hải Thành cũng không cấm họ ở chỗ khác. Tuy nhiên, người tu hành cần gì thì chỉ có Tây Thành mới bán, tỉ như linh dược, linh thực hay tài liệu luyện khí. Đương nhiên, trừ bỏ trường hợp của Điền đại phu.\r\n\r\nCuối cùng là Trung Ương Thành, diện tích nhỏ nhất nhưng cũng là nơi quan trọng nhất. Bởi vì... Phủ Thành chủ tọa lạc ở đây.\r\n\r\nThành chủ của Nguyệt Hải Thành Khương Hy chưa bao giờ gặp nhưng cũng có nghe các trưởng lão ở Cửu Tiêu Tông nói qua, tu vi là Kim Đan đỉnh phong, thậm chí là có xu hướng Hóa Nguyên cảnh.\r\n\r\nVới thân phận \"Phù Linh\" mà nói, Nguyệt Hải Thành chủ là vãn bối, năm nay cũng gần sáu trăm tuổi. Đại nạn sắp tới, không lâu nữa nếu không đột phá đến Nguyên Anh, vị thành chủ này liền vẫn lạc. Tình huống hiện tại của Phủ Thành chủ có lẽ không được tốt lắm.\r\n\r\nNgoài vị thành chủ này ra, Nguyệt Hải Thành còn vài cái thế gia, nổi trội liền là Thẩm, Tô, Lý, Tưởng tứ đại thế gia. Bốn nhà này có Kim Đan tu sĩ tọa trấn. Tứ đại thế gia nằm ở Tây và Nam Thành.\r\n\r\nĐể cân bằng cuộc sống giữa người tu hành và phàm nhân, Nguyệt Hải Thành bắt buộc phải đặt ra một vài thiết luật như sau.\r\n\r\nThứ nhất, tu sĩ tu vi từ Kim Đan kỳ trở lên mới được quyền phi hành trong nội thành.\r\n\r\nThứ hai, tu sĩ không được phép xuất thủ trong thành. Nếu đánh thì ra ngoại thành, không thì đệ đơn lên phủ Thành chủ, mọi chuyện liền giải quyết ở lôi đài.\r\n\r\nThứ ba, tu sĩ không được can thiệp vào cuộc sống của phàm nhân.\r\n\r\nThứ tư, ở nội thành, tu sĩ và phàm nhân bình đẳng.\r\n\r\nThứ năm, người vi phạm, nhẹ thì bị phế, nặng trực tiếp giết.\r\n\r\nNăm điều này Khương Hy cảm thấy cũng tương đối ổn, duy chỉ có điều thứ tư là hắn có chút khinh thường.\r\n\r\nTu sĩ và phàm nhân... bình đẳng được sao?\r\n\r\n...\r\n\r\nVừa đi vừa xem Nguyệt Hải Thành, Khương Hy không để tâm rằng mấy vị cô nương xung quanh đều đang nhìn hắn. Quả thực, qua một tháng tĩn dưỡng và khôi phục thương thế, Khương Hy liền trở về với dáng vẻ tiểu bạch kiểm trước kia.\r\n\r\nKhông có Điền đại phu và Tứ nương ở cạnh, Khương Hy không cần phải bày bộ dạng trẻ ngoan ra. Hắn lúc này trông tĩnh lặng như mặt hồ, mang trên người một phong vị bí ẩn mà khiến người tò mò.\r\n\r\nPhía sau hắn có một ánh mắt đang nhìn, từ lúc Khương Hy bước vào con đường này, ánh mắt kia đã luôn nhìn vào hắn.\r\n\r\nChủ nhân của ánh mắt kia thầm nghĩ.\r\n\r\nQuái lạ.\r\n', 4, 6);
INSERT INTO `book_thongtinchuongtruyen` (`id`, `ten_chuong`, `noi_dung_chuong`, `thu_tu`, `id_truyen_id`) VALUES
(20, 'Thiên sinh phế tài', 'Khương Hy đang đi trên con đường lớn nhất Bắc Thành - Thủy Vũ Lộ. Con đường này trước nay tên là Thạch Lộ, mặt đường được xây dựng bằng đá, chúng chính là từ đá khối tự nhiên. Những khối đá được xếp xen kẽ nhau không theo bất cứ trật tự nào, mặt đá bị nhẵn mài qua năm tháng do người qua lại.\r\n\r\nMỗi bước Khương Hy đi đều mang lại cho hắn một cảm giác khá khó chịu. Cứ như đang có thứ gì đó xuyên vào thân thể, những người khác không nhận thấy nhưng hắn lại rõ ràng.\r\n\r\nKiếm khí, hơn nữa vô cùng mỏng, mỏng đến vô hại nhưng lại rất khó chịu với những người nhận ra nó.\r\n\r\nKhương Hy trầm mặc:\r\n\r\n\"Con đường này bị người chém ra từ lâu về trước sao?\"\r\n\r\nBỗng nhiên, hắn nhớ đến một bằng hữu ở kiếp trước, một vị kiếm tu, đúng hơn là kiếm điên, một tên điên đúng nghĩa. Kiếm khí ở đây tuy mỏng nhưng đang dần phai đi, người chém một kiếm kia yếu hơn vị bằng hữu của hắn. Trong đầu hắn liền nhảy lên một cái tên.\r\n\r\nNguyệt Hải Thành chủ Mặc Hiên.\r\n\r\nKhương Hy nghĩ đến vị thành chủ này, hắn không chắc Thành chủ có phải kiếm tu hay không. Hắn chỉ biết, không phải Kim Đan, không thể chém ra một kiếm kia.\r\n\r\n...\r\n\r\nHằng năm, Nguyệt Hải Thành sẽ đón một mùa mưa bão trước khi đông đến, mỗi cơn mưa trút xuống Thạch Lộ đều tạo thành cơn lũ xuôi đường về Đông Thành hướng ra biển. Kỳ lạ là dòng nước lũ không ảnh hưởng gì đến nhà cửa xung quanh cả. Chúng di chuyển như thể đã được định sẵn lộ tuyến vậy. Thủy Vũ Lộ từ đó mà ra đời, đây là một kỳ quan của Nguyệt Hải Thành, tiền đề là có người đủ can đảm đứng giữa mưa bão để xem.\r\n\r\nDọc Thủy Vũ Lộ, mặc cho bao ánh nhìn về phía hắn, Khương Hy lại không để ý là bao. Hắn nguyên bản vốn không cùng đường với những con người này, tự dưng không quan tâm. Hắn hiện tại quan tâm về con đường đi sau này hơn, hắn có nên tu tiên tiếp không?\r\n\r\nTu tiên cầu trường sinh, đây là lý niệm mà phàm nhân công nhận. Tiên gia được người người cung phụng, người người kính trọng, điều này đúng.\r\n\r\nNgược lại, con đường nào chết nhanh nhất, Khương Hy liền trả lời tu tiên. Người cùng ngươi hôm nay xưng huynh gọi đệ, hôm sau liền chém ngươi chỉ vì một viên đan dược.\r\n\r\nCon đường tu tiên rất mịt mờ, không biết thứ gì đang đợi phía trước. Mà thứ không biết mới là thứ đáng sợ nhất.\r\n\r\nLấy thọ nguyên trăm tuổi làm một cái khảm quan, phàm nhân sống không quá trăm tuổi, họ không sợ chết, tu sĩ sống hơn trăm năm, liền sợ chết. Sống càng lâu càng sợ chết.\r\n\r\nĐời trước, hắn sống hơn ngàn năm, cuối cùng tọa hóa. Ở một nghĩa nào đó, hắn còn sống nhưng một chân từng bước vào tử môn quan. Có lẽ hiện giờ hắn mới là người sợ chết nhất.\r\n\r\nKhương Hy thở dài lắc đầu, tự tranh cãi điểm này liền không có kết quả. Hắn dừng lại nhìn quanh rồi vào một quán nước bên đường. Quán nước này không lớn, chỉ gồm vài tấm phản gỗ, mỗi tấm ở giữa đều có một cái ô được dựng lên che nắng. Ngồi xuống gọi nước, hắn tiếp tục trầm mặc.\r\n\r\nTu hay không tu, hiện giờ hắn chưa quyết được. Ít nhất hắn hiểu tu tiên mới có thực lực.\r\n\r\nThực lực ở đây không đơn thuần đại diện cho sức mạnh vũ lực mà còn là trí lực, địa vị, thế lực, tiền tài và nhân duyên. Thực lực trong tay, không nhờ Điền đại phu, hắn cũng tự giải quyết được cái kỹ viện kia.\r\n\r\n...\r\n\r\n“Khách nhân, trà của ngài đây”, thiếu nữ mang nước đến cho Khương Hy, hắn ra hiệu để thiếu nữ đặt xuống bên cạnh. Trước khi lui, người thiếu nữ vẫn không quên nhìn hắn thêm một chút.\r\n\r\nCầm chén trà trong tay, nhìn thấy hình ảnh hắn phản chiếu ở trong, hắn liền cười khổ:\r\n\r\n“Có chút phiền a”.\r\n\r\nĐưa chén trà lên uống nhưng chưa đến miệng Khương Hy liền ngưng lại, ánh mắt liền nhìn về bên cạnh. Ở đó từ bao giờ đã có một thiếu niên ngồi nhìn hắn.\r\n\r\nThiếu niên dáng người cao ráo kết hợp với trường bào màu xanh lục được làm từ chất liệu thượng hạng, mái tóc dài mượt thả ra sau rất tùy ý. Gương mặt góc cạnh, tỏ rõ anh khí nhưng vẫn còn chút non nớt. Nhìn chung vẫn rất ưa nhìn.\r\n\r\nSau lưng là hai gia nhân lẳng lặng đứng không nói gì. Ánh mắt thiếu niên tùy ý đánh giá Khương Hy, không chút ngại ngùng nào.\r\n\r\n“Vị công tử này theo tại hạ không biết có chuyện gì cần chỉ giáo?”, Khương Hy nhàn nhạt hỏi người thiếu niên.\r\n\r\nTừ lúc dung hợp linh hồn xong, hắn phát hiện linh thức của hắn mạnh mẽ đến nhường nào. Tuy chưa thế ngoại phóng nhưng trực giác của hắn mẫn cảm hơn rất nhiều.\r\n\r\nTiểu Linh bị cảm nhẹ, hắn không cần bắt mạch cũng cảm nhận được luồng hàn khí trong cơ thể cô bé.\r\n\r\nỞ Thủy Vũ Lộ hắn cảm nhận được từng tia kiếm khí lượn lờ xung quanh mà không một ai biết. Đương nhiên, hắn cũng chỉ biết có người theo dõi mà không rõ là ai.\r\n\r\nNghe Khương Hy nói, vị thiếu niên này có chút ngạc nhiên, không phải vì đối phương phát hiện ra mà là vì ngữ điệu của hắn. Khóe miệng kéo lên, vị thiếu niên liền đáp:\r\n\r\n“Tiểu kỹ nam, ngươi không nhớ bản thiếu gia?”\r\n\r\nThoạt đầu, Khương Hy nhíu mày khó hiểu, nhưng ba chữ ‘tiểu kỹ nam’ hắn liền hiểu, ba chữ đó liền đủ rồi. Trong người hắn, một cỗ oán niệm không rõ bỗng dâng lên, Khương Hy âm thầm rùng mình. Hắn liền nhớ ra vị thiếu niên trước mặt là ai.\r\n\r\nThẩm gia Thẩm Minh.\r\n\r\nỞ Nguyệt Hải Thành, tiếng xấu của Thẩm Minh không ai không biết, hoa hoa công tử chuyên gieo họa cho nữ tử.\r\n\r\nTrong ký ức, Thẩm Minh là kẻ đẩy hắn đến vũng bùn nhơ bẩn, không phải người đầu tiên nhưng tuyệt là người khiến hắn oán hận nhất. Nói khó nghe thì Thẩm Minh từng làm nhục hắn.\r\n\r\nNghe rất kỳ lạ và không hợp thói thường, Thẩm Minh vốn không có hứng thú với nam nhân. Tuy nhiên, Thẩm Minh không vừa mắt Khương Hy. Một phần vì Khương Hy đẹp trai hơn, một phần là Thẩm Minh cảm thấy danh dự thế gia bị xúc phạm.\r\n\r\nMỗi lần Thẩm Minh đến kỹ viện vui chơi, hiển nhiên mấy cô nương kỹ viện sẽ tiếp hắn chu đáo. Nhưng chỉ cần Khương Hy xuất hiện tại đâu, ánh mắt bọn họ bất chợt liền nhìn theo đó. Đường đường là một thiếu gia của đại thế gia mà phân lượng trong mắt nữ nhân lại không bằng một tiểu nhị. Mặt mũi để đâu cho hết?\r\n\r\nCuối cùng, Thẩm Minh liền làm nhục hắn tại kỹ viện. Thân là nam nhân lại bị một nam nhân khác áp, \"Khương Hy\" lúc đó mặt mũi danh dự liền bị mất hết. Từ một tiểu nhị bình thường bị đẩy \"lên\" làm kỹ nam duy nhất của kỹ viện, duy nhất của Nguyệt Hải Thành.\r\n\r\nMay mắn cho hắn là sau đó không có nam nhân rảnh rỗi nào đến tìm hắn. Nam nhân có tiền có quyền thì mặt mũi và danh khí vẫn rất quan trọng, chưa có ai điên như Thẩm Minh. Thay vào đó, nữ nhân tìm đến hắn không ít nhưng là trong âm thầm. Một lần đến tìm là hắn bị che mắt, làm sao hắn biết được ai đang giao hoan với hắn chứ.\r\n\r\nThẩm gia thế lớn, lại là tu chân thế gia, quan phủ bình thường không quản được, cũng quản không nổi. Phủ Thành chủ cho rằng chuyện nhỏ nhặt này không cần quản, thế là Nguyệt Hải Thành mặc sức cho Thẩm Minh tung hoành.\r\n\r\nNghĩ đến những việc này, lòng Khương Hy liền trùng xuống, hắn giữ nét cười trên mặt mà đáp:\r\n\r\n“Thẩm thiếu gia, lúc nãy có chút vội vàng, không nhận ra, thiếu gia thứ lỗi”\r\n\r\n“Ồ, vậy sao?”, Thẩm Minh híp mắt, thầm nghĩ quái lạ, tiểu kỹ nam đáng lý ra nên một mặt oán hận phẫn nộ nhìn hắn mới đúng.\r\n\r\nMặt khác, trong quá khứ, \"Khương Hy\" chưa bao giờ gọi hắn là \"Thẩm thiếu gia\" mà gọi thẳng là Thẩm Minh. Ba chữ \"Thẩm thiếu gia\" nghe tựa như đang mỉa mai vậy.\r\n\r\nVẻ mặt này, thái độ này của Khương Hy làm Thẩm Minh không quen, cũng không thích một chút nào. Gia nhân sau lưng thấy nét mặt Thẩm Minh liền hiểu tâm tình vị thiếu gia này như thế nào, liền quát Khương Hy:\r\n\r\n“To gan, còn không mau dập đầu tạ lỗi thiếu gia”\r\n\r\nTiếng của gia nhân rất to, làm thu hút ánh nhìn của mọi người xung quanh. Vốn định xem trò hay nhưng khi nhận ra Thẩm Minh, đám người liền tản ra, làm như thể \"ta không thấy\", \"ta không biết\", \"đừng liên lụy đến ta\".\r\n\r\nThẩm Minh, tiếng xấu của hắn... đủ lớn.\r\n\r\nKhương Hy nghe vậy, không để ý hắn, nhìn về phía Thẩm Minh nói:\r\n\r\n“Thẩm thiếu gia, tên nô tài này thật quá phận, thiếu gia chưa nói gì mà hắn đã... Ài, thật mất hứng”, Khương Hy lắc đầu thở dài nói.\r\n\r\n“Ngươi...”, tên gia nô kia chưa kịp nói sống lưng liền thấy lạnh, Thẩm Minh đang nhìn hắn, ánh mắt thể hiện rất rõ, ngươi muốn chết. Hắn liền sợ mà câm miệng, nhìn cũng không dám nhìn. Thẩm Minh quay đầu lại cười nói:\r\n\r\n“Tiểu Khương, không cần chấp nhặt hắn, chỉ một cái gia nô mà thôi”.\r\n\r\nThẩm Minh không gọi là ‘tiểu kỹ nam’ nữa mà là ‘tiểu Khương’, xem ra đối phương đã biết Khương Hy được trả tự do rồi. Hai người nhìn nhau, không nói lời nào, duy chỉ có nét cười ở cả hai đều không mất.\r\n\r\nNgười sợ nhất lúc này là đại thúc chủ quán nước. Thiếu nữ lúc trước đưa trà cho Khương Hy là nhi nữ của hắn, thấy Thẩm Minh xuất hiện hắn liền đuổi nhi nữ của mình chạy đi chỗ khác càng xa càng tốt. Đại thúc không biết Khương Hy là ai nhưng dám ngồi ngang hàng mà nói chuyện với Thẩm Minh thì đại thúc cũng không dám đắc tội. Nếu hai người này gây sự tại quán hắn, hắn liền chịu không nổi.\r\n\r\nKhông khí trong quán lúc này thật vắng lặng, khách của hắn chạy đi mất rồi, tiền còn chưa kịp thu, vị đại thúc này thật muốn điên lên rồi.\r\n\r\nMột lát sau, Khương Hy mở miệng:\r\n\r\n“Chúc mừng thiếu gia, thành công bước vào tu tiên lộ”\r\n\r\n“Ngươi nhận ra, tiểu Khương quả nhiên có mắt nhìn người”, Thẩm Minh ngạc nhiên không hiểu sao Khương Hy nhìn ra nhưng cũng cười đắc ý, hắn đặc biệt nhấn ‘tiểu Khương’ như thể đang gợi lại ký ức bị làm nhục ở kỹ viện.\r\n\r\nDù thế nhưng đúng, Thẩm Minh tu vi đã là Luyện Khí tầng hai đỉnh phong, cơ thể đã sản sinh ra một chút linh lực. Dựa vào trực giác, Khương Hy đã biết. Gia nhân khác sau lưng thấy Thẩm Minh đắc ý liền vuốt mông ngựa\r\n\r\n“Đương nhiên, thiếu gia nhà ta liền là thiên tài, đợt thu đồ sắp tới của Hạo Nhiên Thư viện thiếu gia nhất định đoạt được ba vị trí đầu”\r\n\r\n“Hạo Nhiên Thư viện?... Đã bắt đầu thu đồ rồi sao?”, Khương Hy thầm nghĩ. Ngoài mặt vẫn cười chúc:\r\n\r\n“Thiếu gia quả thật thiên tài, Hạo Nhiên Thư Viện thiếu gia chắc chắn đi được”.\r\n\r\nMặc dù vẫn còn chướng tai hai chữ \"thiếu gia\" từ miệng Khương Hy nhưng Thẩm Minh vẫn tương đối hài lòng. Hắn nhìn Khương Hy từ trên xuống dưới, ánh mắt không hề kiêng dè. Bộ dạng của Khương Hy lúc này đem cho hắn cảm giác rất lạ,... hắn có chút hứng thú. Thẩm Minh trầm mặc một hồi nói:\r\n\r\n“Vậy…”\r\n\r\n“Thiếu gia, không còn sớm nữa, ta phải đi, Điền đại phu đang đợi”.\r\n\r\nKhương Hy ngắt lời Thẩm Minh, hắn cảm giác câu kế tiếp không hay ho gì. Nếu Thẩm Minh đã biết hắn được tự do, tất biết địa vị của Điền đại phu. Thẩm Minh không ngu, hắn còn chưa dám trở mặt với Điền đại phu. Mặt khác, thiết luật cũng không phải để trưng, Thẩm Minh dám động, Phủ Thành chủ liền sẽ động.\r\n\r\n“Tiếc thật, hôm nào rảnh, bản thiếu gia sẽ tìm ngươi”, Thẩm Minh thất vọng, cười đáp, câu nói này mang chút ý vị. Sau đó hắn liền đứng dậy đi, hai tên gia nhân liền vội đi theo, hướng của bọn hắn dường như là về Nam Thành.\r\n\r\nKhương Hy cũng đứng dậy đi, nhưng đi về hướng ngược lại.\r\n\r\nĐợi hai người họ đi, vị đại thúc kia liền thở phào nhẹ nhõm. Người qua đường cũng lại an ủi trấn an, vị đại thúc này hôm nay chịu không ít kích thích rồi.\r\n\r\n\"Ông chủ, vất vả rồi!\", có người trấn an, đại thúc liền phất tay bảo không sao. Chợt cả thân hình liền ngưng trệ lại. Mặt liền tức giận, nghiến răng ken két, mọi người xung quanh thấy làm lạ, chỉ có đại thúc hiểu. Hai tên tiểu tử đó chưa trả tiền.\r\n\r\n...\r\n\r\n...\r\n\r\n\"Thiếu gia, kế tiếp chúng ta làm gì đây?\", vị gia nhân trước đó bị Thẩm Minh trừng mắt bây giờ mới dám mở miệng.\r\n\r\n\"Đi kỹ viện\", Thẩm Minh nói, sau khóe miệng đều kéo, bổ sung, \"Ở Nam Thành\".\r\n\r\nHai gia nhân nghe vậy liền không nói gì thêm, hộ tống Thẩm Minh đi về Nam Thành. Hầu hạ vị thiếu gia này bao lâu hai người há lại không hiểu, tâm trạng hắn lúc này không tốt.\r\n\r\nTrong lòng Thẩm Minh tức giận, thầm mắng:\r\n\r\n“Tiểu kỹ nam ngươi được lắm, để bản thiếu gia xem lão Điền giữ ngươi được bao lâu”.\r\n\r\nHắn hôm nay quả thực bị xem thường, trước đó Khương Hy cười nói ngang hàng với hắn làm hắn tức giận vô cùng. Bị xếp ngang hàng với \"kỹ nam\" là hạ thấp thân phận của hắn. Khương Hy dù chuộc thân nhưng trong mắt Thẩm Minh, kỹ nam cũng chỉ là kỹ nam mà thôi.\r\n\r\nHắn lại lẩm bẩm nhỏ tiếng mắng:\r\n\r\n\"Ta từng đẩy ngươi làm kỹ nam một lần thì tất có lần tiếp theo. Đến lúc đó, bản thiếu gia sẽ cho ngươi biết thế nào là \"dục tiên dục tử\", đến chết đi sống lại cũng đừng mơ mà cầu xin”.\r\n\r\nThẩm Minh thật nổi giận rồi, kỹ viện Nam Thành hôm nay... xong rồi.\r\n\r\nTrong lúc Thẩm Minh nổi giận đùng đùng hướng về Nam Thành. Khương Hy lại đang nén cỗ oán niệm ở trong người hắn\r\n\r\n\"Bình tĩnh nào... bình tĩnh nào”.\r\n\r\n“Yên tâm, ta nhất định sẽ báo thù cho ngươi\", Khương Hy thì thào với lòng mình, một lát sau cỗ oán niệm kia liền giảm đi. Hắn cười hài lòng, sau đó liền trầm mặc.\r\n\r\nThẩm Minh đã Luyện Khí tầng hai, bây giờ khó giết hắn, nhưng cũng không phải không có khả năng. Thẩm Minh năm nay mười bảy tuổi, ở tuổi này mà Luyện Khí tầng hai thì tương đối xem như tạm được.\r\n\r\nHắn không dám làm tới tức vẫn kiêng kị Điền đại phu. Thẩm gia đương nhiên không sợ Điền đại phu, cũng không sợ vị tôn tử kia. Chân chính Thẩm gia kiêng kị là thế lực mang tên ‘Phủ Thành chủ’. Nhưng việc của Thẩm Minh còn chưa đến mức phiền đến hai bên.\r\n\r\nTrầm mặc một hồi, Khương Hy kết luận.\r\n\r\nTu vi của Thẩm Minh dưới trợ lực thế gia mà vẫn chỉ có thế thì chỉ có thể giải thích rằng Thẩm gia không coi trọng Thẩm Minh, cũng đồng nghĩa với việc tư chất của Thẩm Minh tuyệt đối bình thường. Trong hàng ngũ thế hệ trẻ của Thẩm gia chắc chắn có người cao hơn hắn.\r\n\r\n\"Nếu vậy vẫn có cơ hội\", hắn tự nói.\r\n\r\nNghĩ đến việc ban nãy gọi Thẩm Minh là thiên tài, Khương Hy có chút hoài niệm. Kiếp trước hắn gặp qua thiên tài không ít, tư chất vượt xa Thẩm Minh, tâm tính ở một đẳng cấp hoàn toàn khác. Nhớ đến những người này rồi lại nghĩ đến Thẩm Minh, Khương Hy lẩm bẩm:\r\n\r\n\"Thiên tài\"\r\n\r\n\"Thiên tài\"\r\n\r\n\"...\"\r\n\r\nSau khóe miệng hắn liền kéo ra.\r\n\r\n\"Thiên sinh phế tài\"\r\n\r\nTrên bầu trời, ánh sáng liền ảm đạm đi, mặt trời liền trốn, màn đêm dần kéo tới. Con đường tu tiên của Khương Hy đã bắt đầu rồi.\r\n\r\n...', 5, 6),
(22, 'CHƯƠNG 1', 'Người ta nói ta là kẻ si dại—  \r\n\r\n \r\n\r\nLúc lang quân lận đận, ta chẳng rời chẳng bỏ.  \r\n\r\nĐến khi lang quân quyền cao chức trọng, ta lại nhất quyết rời đi.  \r\n\r\n \r\n\r\nNghe vậy, ta chỉ khẽ cười.  \r\n\r\n \r\n\r\nLang quân báo đáp ta—là vì ta đã ở bên hắn khi hắn còn thấp kém.  \r\n\r\n \r\n\r\nNhưng ta nào phải hạng người dựa vào ân tình để cầu báo đáp?  \r\n\r\n \r\n\r\nTa thu dọn hành lý, chuẩn bị về quê.  \r\n\r\n \r\n\r\nNào ngờ, hắn lại chặn ta vào góc tường, mắt đỏ hoe, giọng khàn khàn hỏi:  \r\n\r\n \r\n\r\n\"Nàng thực sự… chưa từng có chút tình ý nào với ta sao?\" \r\n\r\n \r\n\r\n01\r\n\r\n \r\n\r\nỞ kinh thành, ta mở một quán bánh bao, sống cùng một thiếu niên tầm mười ba mười bốn tuổi và một vị lang quân khôi ngô tuấn tú.  \r\n\r\n \r\n\r\nNhưng… chỉ có mình ta thấy lang quân này tuấn tú.  \r\n\r\n \r\n\r\nNgười ngoài đều chê hắn lôi thôi lếch thếch, tránh hắn càng xa càng tốt.  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nQuê ta vốn ở Nghiệp Thành.  \r\n\r\n \r\n\r\nNghiệp Thành lũ lụt quanh năm, dân không thể yên ổn sinh sống.  \r\n\r\n \r\n\r\nNhưng có một ngày, có một vị quan giỏi trị thủy đến đây, dành ba năm để sửa sang hệ thống kênh rạch.  \r\n\r\n \r\n\r\nTừ đó, dân chúng Nghiệp Thành mới có hy vọng.  \r\n\r\n \r\n\r\nMà ta, chính là một tiểu nha hoàn chuyên quét dọn trong phủ của vị quan trị thủy ấy—Tạ đại nhân.  \r\n\r\n \r\n\r\n*\r\n\r\n Một ngày nọ, trong kinh truyền đến thánh chỉ, gọi Tạ đại nhân về triều.  \r\n\r\n \r\n\r\nQuản sự trong phủ nói:  \r\n\r\n \r\n\r\n\"Nhà họ Tạ đã sụp đổ rồi.  \r\n\r\n \r\n\r\n\"Tạ đại nhân cũng bị liên lụy, e rằng… từ nay về sau không thể tiếp tục trị thủy ở Nghiệp Thành nữa.\"  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nNhà họ Tạ vốn là danh môn vọng tộc chốn kinh thành, mà tỷ tỷ của Tạ đại nhân—Tạ Hiền Phi, còn là phi tần của đương kim Hoàng đế.  \r\n\r\n \r\n\r\nHắn vốn là công tử quyền quý, nhưng lại không sợ cực khổ, cố chấp dựa vào bản lĩnh của chính mình để tạo dựng sự nghiệp, nên mới đến Nghiệp Thành—vùng đất quanh năm chịu lũ lụt.  \r\n\r\n \r\n\r\nLúc đầu, ta cứ nghĩ hắn chỉ là thiếu niên nông nổi bồng bột, nhưng không ngờ…  \r\n\r\n \r\n\r\nBa năm nhậm chức, hắn cần mẫn tận tụy, ngày đêm vất vả không ngơi tay.  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nNgày ấy hắn đến, là một chàng thiếu niên với đôi mắt trong trẻo, chẳng màng phồn hoa đô hội, chỉ một lòng hướng về bách tính khốn khổ.  \r\n\r\n \r\n\r\nMột người tận tâm tận lực như vậy, sẽ bị liên lụy ra sao?  \r\n\r\n \r\n\r\nTa không khỏi lo lắng.  \r\n\r\n \r\n\r\nTa giỏi nhất là làm bánh bao, mà vị đại thái giám đến truyền chỉ cũng rất thích ăn bánh.  \r\n\r\n \r\n\r\nÔng ta nói bánh bao nhân thịt của ta có hương vị giống hệt món ăn mà hồi nhỏ ông từng được nếm.  \r\n\r\n \r\n\r\nVì vậy, ông ta đã thưởng ta không ít bạc.  \r\n\r\n \r\n\r\nSố bạc này, ta chia thành ba phần:  \r\n\r\n \r\n\r\nMột phần đưa cho Vương thúc quản sự, người đã giới thiệu ta vào phòng bếp làm việc.  \r\n\r\nMột phần ta giữ lại.  \r\n\r\nPhần còn lại, đưa cho một tiểu thái giám đi theo đại thái giám.  \r\n\r\n \r\n\r\nTiểu thái giám ấy còn trẻ lắm, nhận bạc xong, vừa ăn bánh bao của ta, vừa nói chuyện phiếm với ta.  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nThì ra…  \r\n\r\n \r\n\r\nTạ Hiền Phi trong cung bị phát hiện dùng tà thuật yểm bùa nguyền rủa Hoàng hậu và Thái tử.  \r\n\r\n \r\n\r\nCòn ở tiền triều, có ngự sử dâng sớ tố cáo lão gia nhà họ Tạ tham ô nhận hối lộ, có dã tâm bất chính.  \r\n\r\n \r\n\r\nChứng cứ vô cùng xác thực, không thể chối cãi.  \r\n\r\n \r\n\r\nTạ Hiền Phi bị giam vào lãnh cung, còn Ngũ hoàng tử do nàng ta sinh ra, cũng bị đày đến Sơn Tây.  \r\n\r\n \r\n\r\nToàn bộ nam nhân trong nhà họ Tạ đều bị cách chức.  \r\n\r\n \r\n\r\nLần này Tạ đại nhân bị triệu về kinh, sợ lành ít dữ nhiều.  \r\n\r\n \r\n\r\nLành ít dữ nhiều?  \r\n\r\n \r\n\r\nTrước khi đi, tiểu thái giám ấy còn làm động tác c.ắ.t c.ổ với ta.  \r\n\r\n \r\n\r\nNhưng mà…  \r\n\r\n \r\n\r\nHắn là một vị quan tốt!  \r\n\r\n \r\n\r\nNếu hắn chếc ở Nghiệp Thành, bách tính nơi đây sẽ chôn cất cho hắn, sẽ thờ phụng hắn.  \r\n\r\n \r\n\r\nNhưng còn kinh thành thì sao?  \r\n\r\n \r\n\r\nNgười ở kinh thành có biết hắn là người tốt không?  \r\n\r\n \r\n\r\nHọ có an táng hắn tử tế không?  \r\n\r\n \r\n\r\nTa không yên tâm.  \r\n\r\n \r\n\r\nVì thế, ta quyết định lặng lẽ đi theo đoàn người, cùng hắn vào kinh.  \r\n\r\n \r\n\r\nNếu Hoàng đế giếc hắn…  \r\n\r\n \r\n\r\nVậy thì ta sẽ mai táng hắn. \r\n\r\n \r\n\r\n02\r\n\r\n \r\n\r\nTa không có cha mẹ, cũng chẳng có huynh đệ tỷ muội.  \r\n\r\n \r\n\r\nMột thân một mình, cô độc lẻ loi, vậy thì còn có gì đáng sợ nữa?  \r\n\r\n \r\n\r\nĐã nhận ân huệ của người, tất nhiên phải báo đáp.  \r\n\r\n \r\n\r\nLàm nha hoàn quét dọn ba năm ở Tạ phủ, ta cũng dành dụm được chút bạc.  \r\n\r\n \r\n\r\nCộng thêm tiền thưởng của đại thái giám, nếu đi kinh thành, chắc cũng có đường sống.  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nVương thúc, người quản sự trong phủ, là cố nhân của phụ thân ta.  \r\n\r\n \r\n\r\nNhững năm qua, thúc luôn chiếu cố ta rất nhiều.  \r\n\r\n \r\n\r\nNếu không nhờ thúc, ta cũng không có cơ hội vào phủ Tạ đại nhân làm nha hoàn quét dọn.  \r\n\r\n \r\n\r\nThúc thấy ta quyết tâm lên kinh, vẫn nhịn không được mà khuyên nhủ:  \r\n\r\n \r\n\r\n\"Nha đầu à, bên ngoài lạ nước lạ cái, vẫn là đừng đi thì hơn.\"  \r\n\r\n \r\n\r\nThúc tuổi đã cao, lưng hơi còng, đôi mắt cũng đã đục ngầu.  \r\n\r\n \r\n\r\nThế nhưng, trong ánh nhìn ấy vẫn đầy ắp sự quan tâm.  \r\n\r\n \r\n\r\nCha ta mất đã nhiều năm, từ lâu không còn ai nhìn ta bằng ánh mắt như vậy nữa.  \r\n\r\n ', 1, 11),
(23, 'CHƯƠNG 2', 'Ta ngồi xuống bậc thềm, khẽ thở dài:  \r\n\r\n \r\n\r\n\"Vương thúc, đừng khuyên nữa.  \r\n\r\n \r\n\r\n\"Nếu không nhờ ngài ấy, năm đó con đã chếc trong dòng Trường Hà rồi.  \r\n\r\n \r\n\r\n\"Giờ nếu có mất mạng, cũng coi như vì ngài ấy mà chếc.  \r\n\r\n \r\n\r\n\"Xem như con trả lại ân tình này.\"  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nVương thúc không khuyên nữa.  \r\n\r\n \r\n\r\nÔng chuẩn bị cho ta một tay nải, nói là Vương thẩm đã khâu một bộ y phục, còn chuẩn bị cả lương khô cho ta.  \r\n\r\n \r\n\r\nTrên đường đi, ta mở tay nải ra xem.  \r\n\r\n \r\n\r\nNgoài y phục và lương khô như thúc nói, còn có cả một túi bạc giấu bên trong, số lượng còn nhiều hơn cả số bạc ta để lại cho ông.  \r\n\r\n \r\n\r\nTa vốn định rời đi không chút vướng bận, nhưng các người làm vậy… lại khiến ta muốn rơi nước mắt.  \r\n\r\n \r\n\r\nTa quỳ xuống bên vệ đường, dập đầu về phía Nghiệp Thành.  \r\n\r\n \r\n\r\nTiểu thái giám đi tới, tò mò hỏi:  \r\n\r\n \r\n\r\n\"Ngươi quỳ lạy làm gì vậy?\"  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nTiểu thái giám này tên là Hỉ Lai, là nghĩa tử của đại thái giám đến truyền chỉ.  \r\n\r\n \r\n\r\nSuốt chặng đường, ta đi theo phía sau quan binh áp giải, mặc dù phong trần mệt mỏi, nhưng may mắn vẫn bình an vô sự.  \r\n\r\n \r\n\r\nHỉ Lai tính cách hoạt bát lanh lợi, thường xuyên chạy về phía sau trò chuyện cùng ta.  \r\n\r\n \r\n\r\nHắn nói vị đại thái giám này không phải người tầm thường, mà là thái giám thân cận bên cạnh Hoàng đế, họ Tống.  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nTạ đại nhân tên là Tạ Hồng Hiên, mặc dù là đệ đệ ruột của Tạ Hiền Phi, nhưng thực chất còn nhỏ hơn Ngũ hoàng tử mà nàng ta sinh ra một tuổi.  \r\n\r\n \r\n\r\nKhi nhậm chức ở Nghiệp Thành, hắn mới chỉ hai mươi mốt.  \r\n\r\nKhông ai ngờ rằng một công tử trẻ tuổi sinh ra trong nhung lụa lại có thể làm nên thành tựu to lớn như vậy.  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nHồi còn nhỏ, Tạ Hồng Hiên cùng Ngũ hoàng tử lớn lên trong hoàng cung.  \r\n\r\n \r\n\r\nNhững năm thơ bé, hắn thích nhất là chạy nhảy bên chân Hoàng đế, rõ ràng các hoàng tử khác đều không dám, nhưng hắn thì gan to bằng trời.  \r\n\r\n \r\n\r\nMà Hoàng đế lại vô cùng yêu thích hắn, đi đâu cũng phải dẫn theo.  \r\n\r\n \r\n\r\nMỗi lần chơi đùa mệt mỏi, hắn liền gối đầu lên bàn của Hoàng đế mà ngủ.  \r\n\r\n \r\n\r\nHoàng đế tin Tạ gia lão gia tham ô, kết bè kéo cánh, mua quan bán tước.  \r\n\r\n \r\n\r\nNhưng nếu nói rằng Tiểu lang quân mà ngài ấy chứng kiến từ bé cũng là loại người như thế…  \r\n\r\n \r\n\r\nNgài ấy không tin!  \r\n\r\n \r\n\r\nThế nhưng, chuyện của Tạ gia liên lụy quá lớn, Tạ Hồng Hiên dù không dính dáng cũng không thể thoát khỏi.  \r\n\r\n \r\n\r\nHoàng đế lo rằng những quan viên có thù oán với Tạ gia sẽ nhân cơ hội hạ độc thủ, sợ rằng hắn không thể quay lại kinh thành an toàn, nên mới phái Tống công công đích thân đến đón hắn.  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nTống công công là người tận mắt nhìn Tạ Hồng Hiên lớn lên, cũng có chút giao tình.  \r\n\r\n \r\n\r\nDọc đường đi, ông ta nhiều lần động viên an ủi, chưa từng làm khó dễ hắn.  \r\n\r\n \r\n\r\nMà ta cũng được hưởng chút lợi lộc.  \r\n\r\n \r\n\r\nTống công công cảm thấy ta trung thành, nên khi nghỉ ngơi, liền sai Hỉ Lai mang cơm canh nóng hổi cho ta.  \r\n\r\n \r\n\r\nDần dần, ta và Hỉ Lai trở nên thân thiết hơn.  \r\n\r\n \r\n\r\nHỉ Lai buồn bực nói:  \r\n\r\n \r\n\r\n\"Ngươi thật đúng là kẻ câm điếc!  \r\n\r\n \r\n\r\n\"Không phải cha nuôi ta nói ngươi là người tốt, thì ta cũng chẳng thèm để ý đâu!\"  \r\n\r\n \r\n\r\nTa đáp nhẹ:  \r\n\r\n \r\n\r\n\"Xin lỗi, ta chỉ muốn ít nói một chút, giữ sức đi đường.\"  \r\n\r\n \r\n\r\nHỉ Lai được ngồi trên xe ngựa với Tống công công, ngồi lâu mỏi chân thì mới xuống đi bộ.  \r\n\r\n \r\n\r\nCòn ta chỉ có thể lẽo đẽo theo sau đoàn người, không dám lơ là.  \r\n\r\n \r\n\r\nHỉ Lai không thực sự tức giận, lại tiếp tục kể:  \r\n\r\n \r\n\r\n\"Hôm qua ta nói chuyện với Tạ đại nhân, ngài ấy nói không biết ngươi tên gì.\"  \r\n\r\n \r\n\r\n\"Ừm.\"  \r\n\r\n \r\n\r\nHắn không nản, tiếp tục nói:  \r\n\r\n \r\n\r\n\"Ngươi không thấy buồn sao?  \r\n\r\n \r\n\r\n\"Ngươi đối với Tạ đại nhân một lòng một dạ, mà ngài ấy thậm chí không nhớ nổi tên của ngươi.\"  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nLàm sao hắn biết được.  \r\n\r\n \r\n\r\nTừ ngày đầu tiên bắt tay vào trị thủy, Tạ Hồng Hiên không màng ngày đêm, nếu không phải ở kênh rạch, thì cũng vùi đầu trong thư phòng.  \r\n\r\n \r\n\r\nĐói thì chỉ ăn một miếng màn thầu với dưa muối, mệt thì trải thảm xuống đất mà ngủ.  \r\n\r\n \r\n\r\nĐừng nói là ta, ta e rằng ngay cả hắn cũng không biết cửa phòng mình quay về hướng nào.  \r\n\r\n \r\n\r\n*\r\n\r\n \r\n\r\nHỉ Lai nhìn ta chằm chằm, chớp chớp mắt:  \r\n\r\n \r\n\r\n\"Ta nói với ngài ấy rồi, ngươi tên là Lý Linh.  \r\n\r\n \r\n\r\n\"Ngài ấy bảo sẽ nhớ kỹ.  \r\n\r\n \r\n\r\n\"Ngươi vui chứ?\"  \r\n\r\n \r\n\r\nTa mặt không đổi sắc:  \r\n\r\n \r\n\r\n\"Vui.\"  \r\n\r\n \r\n\r\nHỉ Lai gãi đầu, lẩm bẩm:  \r\n\r\n \r\n\r\n\"Ngươi đúng là nữ nhân kỳ quái nhất mà ta từng gặp.\"  \r\n\r\n \r\n\r\nTa nhìn hắn, một thiếu niên mười ba mười bốn tuổi, mỉm cười khẽ:  \r\n\r\n \r\n\r\n\"Ngươi đã gặp bao nhiêu nữ nhân rồi?\"  \r\n\r\n \r\n\r\nHỉ Lai lập tức cao hứng:  \r\n\r\n \r\n\r\n\"Ngươi đừng xem thường ta!  \r\n\r\n \r\n\r\n\"Trong cung có biết bao nhiêu phi tần, ai nấy đều như tiên nữ giáng trần.\"  \r\n\r\n \r\n\r\nHắn liếc ta một cái, chậc lưỡi:  \r\n\r\n \r\n\r\n\"Tạ đại nhân cũng lớn lên trong cung, mỹ nhân nào mà chưa từng thấy.  \r\n\r\n \r\n\r\n\"Ngươi nhìn lại ngươi đi, gầy trơ cả xương, bảo sao ngài ấy chẳng buồn nhớ đến tên.\"  \r\n\r\n \r\n\r\nHỉ Lai lại hạ giọng, ra vẻ thần bí:  \r\n\r\n \r\n\r\n\"Trong cung, phi tần muốn được cha nuôi ta nói lời hay trước mặt Hoàng thượng, đều phải đưa bạc.\r\n\r\n', 2, 11),
(24, 'a', 'aaa', 3, 11),
(25, 'bb', 'bbbbbb', 4, 11),
(26, 'a', 'aaaa', 3, 7),
(27, 'bb', 'bbbb', 4, 7),
(29, '6666', '66666', 5, 7),
(30, 'Xuyên không', 'Khi tỉnh lại, Đỗ Thanh Thần cứ tưởng mình đã vượt qua được cửa tử và trở lại phòng bệnh quen thuộc, nhưng khi nhìn rõ khung cảnh xung quanh, cậu ngây người ra.\r\n\r\nNhững bức tường đất cũ kỹ, mái nhà lợp rơm, bên dưới là phản đất lạnh lẽo, trong không khí phảng phất mùi ẩm mốc... Đây là đâu vậy?!\r\n\r\nBác sĩ đâu rồi? Không phải cậu vừa nguy kịch và được đưa vào phòng cấp cứu hay sao? Tại sao lại ở nơi này?!\r\n\r\n“Ca!” Một giọng nói non nớt vang lên. Đỗ Thanh Thần theo bản năng nghĩ rằng đó là người bạn hay đến thăm mình trong bệnh viện. Nhưng khi quay đầu lại, trước mặt cậu không phải là người quen, mà là một thiếu niên khoảng mười tuổi. Cậu bé có gương mặt thanh tú, đôi mắt hoe đỏ đầy nước, hớn hở lao về phía cậu.\r\n\r\nNước mắt cậu nhóc rơi lã chã xuống, bàn tay lấm lem bụi đất đưa lên lau mặt: “Ca, đệ cứ tưởng huynh… hu hu…”\r\n\r\nĐỗ Thanh Thần cố gắng mấp máy đôi môi, tiếng khóc nức nở khiến đầu cậu đau nhói từng cơn. Cậu nhíu mày, yếu ớt hỏi: “Cậu… là ai?”\r\n\r\nCậu bé giật mình ngẩng đầu, ánh mắt hoảng sợ: “Ca! Đệ là đệ đệ của huynh mà! Đệ là Đỗ Như Lâm đây! Huynh không nhận ra đệ sao?!”\r\n\r\nĐỗ Như Lâm?\r\n\r\nCậu là cô nhi, từ nhỏ đã sống một mình, làm gì có đệ đệ nào?! Đầu cậu đau nhói, từng đợt từng đợt như muốn nổ tung.\r\n\r\n“Phụ thân ơi! Ca không nhận ra con nữa rồi!” Cậu bé vừa khóc vừa quay về phía cửa gọi lớn.\r\n\r\nMột người đàn ông gầy yếu, dáng vẻ tiều tụy từ từ bước vào. Ông ho từng cơn, thân hình run rẩy. Đôi mắt mờ đυ.c tràn ngập lo âu nhìn về phía Đỗ Thanh Thần.\r\n\r\n“Thanh Thần?” Giọng nói của ông vừa run rẩy, vừa mang theo vẻ bất an.\r\n\r\nCơn đau trong l*иg ngực Đỗ Thanh Thần như dâng trào, giống như có thứ gì đó muốn xé toạc l*иg ngực cậu mà chui ra ngoài. Cậu đưa tay ôm lấy ngực, không nói một lời, đầu óc ong ong từng cơn rồi lịm đi.\r\n\r\nĐây là thôn Đỗ Gia, một ngôi làng nhỏ nằm sát chân núi. Dân làng ở đây sinh sống qua nhiều đời, phần lớn đều có họ hàng gần xa. Trong ngôi nhà này, Đỗ Thanh Thần là trưởng nam, có một đệ đệ tên là Đỗ Như Lâm. Mẫu thân cậu đã qua đời từ lâu, gia đình chỉ còn ba người nương tựa nhau sống qua ngày.\r\n\r\nNhững ký ức này hiện lên rõ ràng trong đầu cậu sau khi tỉnh lại lần thứ hai. Và rồi cậu nhận ra, mình đã xuyên không.\r\n\r\nNơi này chính là thế giới trong cuốn tiểu thuyết mà bạn cậu từng đọc!\r\n\r\nCó lẽ cậu đã chết trên bàn mổ, nhưng việc được sống lại ở một thế giới khác đã là một may mắn. Đỗ Thanh Thần nằm trên chiếc phản đất cũ kỹ, khẽ nhếch môi cười khổ. Dẫu sao, chỉ cần còn sống thì dù ở đâu cũng đáng quý.', 1, 12),
(31, 'Tôi đang ở đâu? Tôi ở đây nè! ', 'Thời điểm Tống Trường An mở mắt phát hiện xung quanh một mảng đen kịt vừa oi bức vừa ẩm ướt, chóp mũi mơ hồ ngửi thấy mùi hôi thối, chỉ là hình như đã ở nơi này khá lâu rồi, mùi hôi thối giường như mơ hồ, không phân biệt được mùi hương này có phải là ảo giác của cậu hay không. Cậu hơi khó chịu nghĩ lại xem nơi này là đâu nhưng cả người lại không có chút lực, đầu choáng váng như hậu quả của việc xoay vòng vòng một nghìn lần vậy, cậu chỉ có thể ngoan ngoãn nằm một chỗ nhưng dù sao cũng khiến cậu cảm thấy dễ chịu hơn chút.\r\n\r\nCậu nghĩ chắc phải nghỉ một chút nữa mới có thể dậy được.\r\n\r\nHôm tất niên, em họ Thẩm Niệm Niệm của cậu không biết làm thế nào mà biết đến Hamster lông vàng, sau lần đó liền si mê không lối thoát, cuối cùng nhờ vào thành tích tốt vào cuối kì mà xin được ba mẹ mua cho một con.\r\n\r\nCô bé thực sự rất thích con Hamster này, ngày nào cũng ôm ấp hôn hít. Nhưng về phía ba mẹ của cô bé lại lo rằng hiện tại nhìn thì được chứ sau khi khai giảng Thẩm Niệm Niệm phải quay trở lại trường nội trú, muốn tự tay chăm sóc căn bản là không thể. Cô bé tìm người trôm nom khắp nơi mà không được vậy là liền nghĩ tới Tống Trường An.\r\n\r\nTrước đó không lâu, Tống Trường An nhận được điện thoại của em họ, cô bé nói rằng bé Hamster lông vàng cô nhờ cậu chăm sóc đã được đưa tới cổng tiểu khu của cậu, nhờ cậu qua đón nó, cũng nói luôn rằng đến khi cô bé từ kí túc xá trở về sẽ đích thân qua đón bé con về nhà, đồng thời mời anh Trường An đẹp trai đi ăn KFC yêu thích của cô, mời thì mời nhưng ai trả tiền thì chưa có chắc lắm.\r\n\r\nTống Trường An bất đắc dĩ cười cười, cậu đứng dậy đi ra khỏi cửa.\r\n\r\nTiểu khu nơi cậu ở không cho phép người ngoài tùy tiện ra vào nên cậu phải chạy ra cổng phía Đông tiểu khu cách đó 200m để tìm người.\r\n\r\nCái l*иg sắt của em họ là một tiểu điền viên được tặng kèm khi mua bé Hamster. Cũng may bé Hamster lông vàng này chỉ mới một tháng tuổi nên thân hình còn khá nhỏ. Tống Trường An tìm tòi trên mạng về cách nuôi Hamster liền quyết định sau khi mang về nhà sẽ đổi cho nó một cái hộp to hơn, cũng tiện chăm sóc hơn.\r\n\r\nNhưng mà dù sao thì hiện tại phần quai xách của tiểu điền viên này đối với Tống Trường An cũng vẫn khá tiện bởi ngoài vị tổ tông sắp được cậu đem về chăm sóc này còn có thêm rất nhiều thứ khác chất đầy cả một thùng giấy.\r\n\r\nTống Trường An nhìn thêm vài lần nữa rồi thầm cảm thán, một đống hộp này mang đi so với đồ ăn bình thường của cậu trông còn ngon hơn, chẳng trách nhóc con này có thể đào rỗng túi tiền của Niệm Niệm nhà mình.\r\n\r\nVà cậu cũng vì thế mà bị tai nạn xe cộ trên đường đi đón Hamster lông vàng về nhà.\r\n\r\nNói là tai nạn xe cộ nhưng thực ra cũng không nghiêm trọng lắm, dù sao cũng là ở trong tiểu khu, cậu cùng một vị lái xe đạp điện nhanh như chớp va vào nhau. Đối phương xuất hiện đột ngột, tốc độ lại quá nhanh. Mà cậu vì phải bảo vệ chiếc l*иg mong manh dễ vỡ trên tay nên nhất thời không phản ứng để tránh kịp, cậu bị đâm ngã vào bồn hoa bên cạnh, không hiểu vì sao lại bất tỉnh.\r\n\r\nTống Trường An thở dài, không biết đây là vận may hay vận rủi nữa.\r\n\r\nGặp tai nạn nhưng dù sao thì hiện tại cậu cũng đã tỉnh, chắc là cơ thể cũng không có vấn đề gì lớn.\r\n\r\nNhưng mà sau khi xem xét tình cảnh hiện tại một chút, Tống Trường An lại không nói nên lời:\".....\"\r\n\r\nCậu đã ngất đi rồi tỉnh lại vậy mà lâu như thế lại không có người đến đỡ cậu dậy, thời buổi này lái xe đạp điện gây ra tai nạn cũng cần phải chạy hả?\r\n\r\nKhông biết vì sao đèn đường bình thường buổi tối vẫn luôn bật sáng mà hôm nay lại không bật, thật không biết là cậu sẽ phải gom đủ sức để tự đứng lên đi tìm bảo vệ trước hay là bảo vệ tuần tra ban đêm phát hiện cậu ngã trong bồn hoa trước nữa.\r\n\r\nMùi hôi thối quẩn quanh nơi chóp mũi như ẩn như hiện, Tống Trường An nằm sấp bất động, là ai không chịu phân loại rác rồi lén vứt vào trong bồn hoa vậy? Thành ra người bị hại không phải bồn cây mà là Tống Trường An cậu á!\r\n\r\nLúc này Tống Trường An tất nhiên là không thể biết được ở nơi mà cậu bị đâm kia, mấy hộp đồ lớn nhỏ rơi đầy đất, chiếc l*иg vỡ tan tành vung vãi một bên, chủ xe đạp điện chật vật bò dậy không quan tâm tay chân bản thân bị trầy hoàng loạn chạy tới cạnh bồn hoa chuẩn bị tới đỡ cậu thanh niên kia dậy lại không ngờ trong bồn hoa rỗng tuếch, đến một bóng người cũng không có.\r\n\r\nChủ xe đạp điện: \"Đệt, người đâu rồi?\"\r\n\r\nCó ai thấy không? Cậu thanh niên kia vừa bị tôi đâm bay ngã đâu rồi?\r\n\r\n***\r\n\r\n\"Thiếu tướng Arnold, ngài không sao chứ!?\" Phó quan Sean nôn nóng theo phía sau Arnold, vẻ mặt đầy tức giận.\r\n\r\n\"Không sao.\" Arnold đáp rồi đi thẳng tới chiếc xe bay.\r\n\r\nLà Thiếu tướng trẻ tuổi nhất Dế quốc, Arnold thân mang vô số công trạng, thăng chức nhanh tới mức làm người khác kinh ngạc, cũng vì thế mà kéo theo không ít người ganh ghét, hội nghị đột xuất hôm nay cũng chính là do kẻ nào đó nhắm vào hắn mà tổ chức nhằm gây phiền phức, Arnold lười nghe bọn họ lải nhải liền trước mặt nhiều người vạch trần tâm tư xấu xa của đám người đó rồi trực tiếp rời đi.\r\n\r\n\"Về nhà.\" Arnold dựa lưng vào ghế ngồi nhìn ra ngoài cửa sổ với vẻ mặt không biểu tình gì.\r\n\r\nHắn không phải người thích nhẫn nhịn chỉ là vẫn luôn nghe theo lời dạy dỗ của ông nội nên chưa từng làm gì quá đáng, nhưng nếu đám người đó muốn gây phiền phức cho hắn thì hắn cũng sẽ không dễ dàng buông tha.\r\n\r\n\"Vâng.\" Sean nói, chiếc xe đen nhanh chóng bay lên, nhanh đến nỗi chỉ kịp để lại một cái bóng vô tình cho đám người phía sau đang đuổi theo.\r\n\r\n\"Mấy người đó thật quá đáng! Trận chiến ở Hoài Thạch Tinh kia nếu không phải ngài đến nhanh thì đám người đó sao còn sống để mà đứng đây? Vậy mà còn không biết tốt xấu muốn cướp công ngài!\" Sean cố nhịn nãy giờ cuối cùng vẫn không nhịn được, môi mấp máy bô bô liền phàn nàn kể tội đám người kia.\r\n\r\nTính tình Thiếu tướng thật tốt, ngày thường đều lười cùng đám người này vòng vo vậy mà lần này lại bị lôi tới trước mặt, tâm trạng xấu thế nào không cần nói cũng biết. Nếu đổi lại là cậu thì cậu đã sớm không chịu nổi từ lâu rồi, làm gì còn để cho bọn họ ở đó tung tăng nữa.\r\n\r\nArnold nhắm mắt nghe Sean luyên thuyên, tên nhóc này là lính mới, tính tình bướng bỉnh còn chưa tiếp xúc nhiều với mặt tối trong quân ngũ nên liền mặc kệ cho cậu ta phàn nàn, chỉ khi nào quá đáng quá mới ngăn lại.\r\n\r\nĐối với người cùng phe, hắn rất khoan dung.\r\n\r\nĐột nhiên hắn nghe được tiếng thở dài cực nhỏ.\r\n\r\n\"?\"\r\n\r\nNơi phát ra âm thanh nhanh chóng bị Arnold phát hiện, ở trong góc xe bay có một cái thùng giấy nhỏ, trên hộp có dán băng dính màu hồng với những kí tự kì lạ, bên cạnh hộp khoét một vài lỗ nhỏ, nó nằm ngang nhiên trước mắt hắn vậy mà trước đó hắn lại không để ý tới.\r\n\r\n\"Đây là cái gì?\"\r\n\r\nNếu hắn nhớ không lần thì đây không phải đồ của hắn, trước khi xuống xe cũng không phát hiện, sao bỗng dưng bây giờ lại xuất hiện ở trên xe hắn?\r\n\r\n\"Vừa nãy có người đến gần xe tôi?\" Nghĩ đến khả năng này, Arnold sắc mặt càng thêm lạnh, luôn có người muốn khıêυ khí©h điểm yếu của hắn.\r\n\r\nKhi hắn để ý đến liền phát hiện có một luồng mùi hôi thối xộc thẳng vào khoang mũi hắn làm hắn nhanh chóng đen mặt.\r\n\r\nSean thiết lập chương trình lái tự động, nhìn tới cũng thấy được cái thùng giấy bị đóng gói nham nhở xấu xí kia trong lòng liền giật mình.\r\n\r\nVừa rồi cậu theo sau Thiếu tướng vào trong nên cũng không biết trên xe đã xảy ra những gì nhưng vẫn không nhịn được mà nghĩ tới phương án tồi tệ nhất.\r\n\r\n\"Cách đây không lâu phía Trung tướng Taar hình như đang nghiên cứu chế tạo một loại bom mới, nghe đồn nói là chuẩn bị dùng trên người ngài... Phải không?\"\r\n\r\nÝ trên mặt chữ, đây sợ là thủ đoạn không rõ ràng của đám người đó.\r\n\r\nBiết rõ thế lực đứng sau lưng Thiếu tướng không đơn giản nhưng một khi dính tới cái lợi của bản thân những kẻ đầu chứa toàn mỡ đó sẽ ra tay nơi chúng cho rằng kín đáo.\r\n\r\nChỉ tiêu thăng chức mỗi năm trong quân đội là hữu hạn, Arnold dành được vị trí đồng nghĩa với việc con nhà quyền quý nào đó sẽ để vuột mất vị trí này. Con trai Trung tướng Taar vốn là ứng cử viên nặng kí trong lần xét duyệt này nhưng lại làm lỡ mất ở phút chót, từ lúc đó hắn liền như vô tình lại cố ý nhắm vào Arnold.\r\n\r\nLúc nãy Arnold dường như nghe thấy âm thanh kì lạ phát ra từ chiếc hộp nhưng hiện tại lại không có chút động tĩnh nào, thực ra hắn không cảm nhận được nguy hiểm từ chiếc hộp này, chỉ là hắn vốn cảnh giác với mọi thứ xung quanh khi xuất hiện không rõ lý do như thế này.\r\n\r\n\"Lát nữa đem tiêu hủy đi.\"\r\n\r\nSean gật đầu cẩn thận đem chiếc hộp bỏ vào hộp cách ly khác đã chuẩn bị từ trước phòng ngừa lát nữa xảy ra chuyện ngoài ý muốn.\r\n\r\nCuộc nói chuyện của hai người kéo dài không lâu, Tống Trường An ở trong hộp lại nghe thấy rõ ràng.\r\n\r\nTống Trường An: \".....\"\r\n\r\nỞ trong bóng tối thính giác của cậu trở nên cực nhanh nhạy, hai giọng nói đó nói vài lời làm cậu mơ hồ, nhưng mơ hồ thế nào cậu cũng không thể nhầm được hai chữ \"Tiêu hủy\" do giọng nói lạnh lùng kia phát ra.\r\n\r\nTiêu hủy? Tiêu hủy cái gì? Linh cảm xấu nảy lên trong đầu cậu.\r\n\r\nNgay sau đó cậu cảm thấy mặt đất bằng phẳng nơi mà cậu đang nằm bò bay lên, cơ thể vô lực mất khống chế trượt qua một bên, cỏ và cái gì đó mềm như bông gòn bọc quanh người cậu làm cậu bị quăng ngã không đau.\r\n\r\nCảm thấy đồ vật trong hộp lăn lộn, Sean nhướn mày lấy làm lạ, vì khứu giác nhanh nhạy của mình khiến cậu ta cũng ngửi được mùi hôi thối toả ra từ bên trong, cậu nhăn cái mũi nói: \"Lát nữa tôi sẽ đem đi hủy.\"\r\n\r\nTống Trường An: \"!!!?\"\r\n\r\nCái quái gì vậy!? Thứ phải tiêu hủy không ngờ lại là cậu! Chuyện quái gì đang xảy ra vậy? Một người còn đang sống sờ sờ như cậu lại bị đối xử tàn nhẫn như vậy sao? Pháp luật đâu hả?\r\n\r\nCậu chỉ bị xe đạp điện đâm một cái chứ chưa có phải đã chết mà!\r\n\r\nNghĩ vậy, Tống Trường An - người luôn trân quý sinh mạng của mình hét hớn, hy vọng có người có thể phát hiện ra hiện thực đen tối ở đây.\r\n\r\n\"Rầm rì! Chít chít chít chít!!\"\r\n\r\nTống Trường An: \".....\" Chờ đã, đây là âm thanh gì vậy? Tại sao cậu lại phát ra âm thanh như thế này?\r\n\r\nCậu dùng hết sức bình sinh đưa tay chạm vào khuôn mặt của mình sau đó thành công sờ đến một cái mặt toàn lông.\r\n\r\nNghe thấy âm thanh kia, tay Sean run lên, Arnold vốn đang nhắm mắt lại trực tiếp đứng thẳng dậy nhìn chằm chằm cái hộp rách nát kia đầy nghi ngờ: \"Đây là... Tiếng của ấu tể?\"\r\n\r\nNăm 2220, cuộc chiến tranh giữa các vì sao chỉ từng xuất hiện trên màn ảnh đã trở thành hiện thực, người địa cầu liên hợp lại bất đắc dĩ phải bước vào vũ trụ, rời đi hành tinh đã vỡ nát không còn sinh mệnh.\r\n\r\nVì để duy trì tôn nghiêm cuối cùng của nhân loại trước các chủng tộc ngoài hành tinh khác mà họ đã phải trải qua một thời gian dài chiến đấu thay đổi thân phận của mình, vì thế vô số người đã trở thành vật thí nghiệm, cấy vào cơ thể gen của dã thú, lấy trí tuệ của nhân loại khống chế thân xác của dã thú, ở trong vũ trụ tràn ngập nguy hiểm đấu tranh để sinh tồn.\r\n\r\nNhững nỗ lực của người xưa đã được đền đáp, nhân loại vẫn chiếm được một hành tinh nhỏ trong vũ trụ, nhưng để tồn tại, sinh sản qua hàng vạn năm họ đã đánh mất lịch sử của nhân loại, họ không còn yếu ớt như trước nhưng cũng không thể lớn mạnh như trước.\r\n\r\nHọ có thể dễ dàng biến đổi qua lại giữa hình dạng người và thú, cơ thể họ được bao trùm bởi một lớp da cứng như kim loại rắn rỏi đủ để họ có thể sinh tồn trong một khoảng thời gian ngắn ở vũ trụ, đây là năng lực mà nhân loại đã từng mơ ước, cũng vì thế mà họ đánh mất rất nhiều năng lực, một trong số đó là khả năng sinh con và nuôi lớn.\r\n\r\nTỷ lệ sinh sản của Đế quốc thấp khủng khϊếp.\r\n\r\nRất nhiều cặp vợ chồng đã kết hôn vài thập niên nhưng vẫn không có con, bất chấp cả mấy vị ở viện nghiên cứu khoa học hao hết tâm tư thế nào thì tỷ lệ sinh sản vẫn gần như bằng 0 không thể cải thiện, thậm chí chuỗi số 0 đằng sau dấu phẩy kia vẫn đang không ngừng tăng lên.\r\n\r\nMọi thứ chỉ miễn cưỡng khắc phục bằng cách tăng tuổi thọ, có nhiều người đến cả mấy trăm năm sống trên đời nhưng vẫn không có cho mình một đứa con.\r\n\r\nCũng bởi vậy mà mỗi một ấu tể ra đời không chỉ được cha mẹ cưng chiều mà chúng còn là bảo bối của toàn nhân loại được mọi người chú ý.\r\n\r\nĐế quốc đã hơn 20 năm không có ấu tể mới ra đời.\r\n\r\nKhông ngờ hiện tại ở ngay trước mặt hai người Arnold và Sean lại có một ấu tể đáng thương bị nhét vào cái thùng thối um, âm thanh sợ hãi của nó cứ thế truyền tới tai họ khiến hốc mắt hai người đều đỏ lên vì giận.\r\n\r\nLàm gì có cặp cha mẹ nào ngu ngốc đến mức ném con mình ra ngoài, cái thùng giấy này sao có thể không một tiếng động xuất hiện trên xe của Arnold cũng thật khả nghi nhưng sự tình liên quan đến ấu tể không phải việc họ có thể chậm trễ, nếu đây thực sự là thủ đoạn của Taar để làm hắn thả lỏng cảnh giác thì thật sự đã chọc giận hắn.\r\n\r\nArnold cẩn thận nhận lấy thùng giấy trong tay Sean, đầu ngón tay dễ dàng cắt bỏ băng dính mở chiếc thùng để lộ ra hộp nhựa trắng bên trong, thùng giấy và hộp nhựa đều có lỗ thủng đưa không khí cần thiết từ bên ngoài vào trong.\r\n\r\nHắn cẩn thận mở nắp đậy lên, bông gòn lộn xộn cùng giấy vệ sinh bị xé vụn và mùn cưa lấp đầy hộp, không khí ẩm ướt, oi bức phả ra, mùi hôi thối bốc lên càng thêm rõ ràng, có nơi còn ướt nhẹp rồi trũng xuống.\r\n\r\nHắn cảm nhận được một hơi thở yếu ớt trong đống lộn xộn này, bởi vì nó quá yếu nên cả hắn và Sean không phát hiện, lúc này bên trong còn truyền ra tiếng kêu của ấu tể, yếu ớt và sợ hãi.\r\n\r\nLúc Arnold đang muốn duỗi tay lục lọi thì đống bông gòn trong góc đột nhiên run lên vài cái, tay hắn vươn ra không dám động đậy bất động tại chỗ, hai người nín thở chờ đợi.\r\n\r\nMột lát sau một cái đầu đầy lông xù xù nho nhỏ nhô ra từ bên trong, bộ lông vàng có chút ẩm ướt bết dính vào nhau, đôi mắt hạt đậu đen nhánh ngập nước như đang muốn khóc, lúc này trong mắt tràn ngập hoảng sợ nhìn chằm chẳm Arnold.\r\n\r\n\"Rầm rì! Rầm rì!\"\r\n\r\nĐừng thủ tiêu tôi được không? Tôi nghỉ ngơi hồi sức một chút liền sẽ đi! Hai ngày thôi!', 1, 13),
(32, 'Bảo bối năm tuổi (1) ', '“Sơ Sơ, máy tính nhà dì hư rồi, bao giờ con sang giúp dì sửa chút nhé?”\r\n\r\nCố Sơ đeo một chiếc ba lô màu hồng nhạt, đôi chân ngắn mũm mĩm bước từng bước nhỏ. Thấy dì Vương đang chào mình, đôi mắt Cố Sơ cong thành hình trăng khuyết đáng yêu: “Dì Vương, mai là thứ Bảy, Sơ Sơ sẽ qua sửa máy tính cho dì.”\r\n\r\nNăm nay Cố Sơ mới năm tuổi, đang học mẫu giáo ở khu dân cư, nhưng đã nổi danh khắp nơi là một thần đồng nhí. Không chỉ xinh xắn đáng yêu, thành tích học tập trong lớp mẫu giáo cũng rất xuất sắc, thậm chí còn biết sửa cả máy tính.\r\n\r\nCố Sơ men theo con hẻm nhỏ trở về nhà, từ xa đã thấy trước cánh cổng cũ nát của nhà mình có một chiếc xe sang đang đỗ. Xe có nội thất tinh xảo, thân xe bóng loáng, trông hoàn toàn không ăn nhập gì với khu phố lụp xụp này.\r\n\r\nPorsche-Panamera, trị giá hàng triệu.\r\n\r\nNgười đến, không giàu cũng quý.\r\n\r\nĐôi mắt đẹp của Cố Sơ khẽ nheo lại, ánh lên một tia sắc bén hoàn toàn không thuộc về một đứa trẻ năm tuổi. Cô nghiêng đầu, nở nụ cười nhạt: “Cuối cùng cũng đến đoạn này rồi.”\r\n\r\nCô đã đến thế giới này một năm, suốt thời gian qua chỉ đóng vai một đứa trẻ ngây thơ vô tội.\r\n\r\nBây giờ chắc đã đến tình tiết về nhà họ Triệu rồi!\r\n\r\nCòn chưa vào cửa, đã nghe thấy tiếng trò chuyện vọng ra từ trong nhà.\r\n\r\n“Mạn Tích, mẹ đã tìm con bao nhiêu năm, day dứt bao nhiêu năm rồi, con theo mẹ về nhà nhé. Mẹ thật sự là mẹ ruột của con, đây là kết quả xét nghiệm ADN.”\r\n\r\n“Là lỗi của mẹ, năm đó con mới có năm tuổi, mẹ không nên đưa con đi mua sắm, nếu không đã không xảy ra chuyện con bị bắt cóc.”\r\n\r\n“Mạn Tích, cho mẹ cơ hội chuộc lỗi được không? Về nhà họ Triệu với mẹ để sống những ngày tháng tốt đẹp. Bố con, anh trai, và cả em gái con đều rất nhớ con.”\r\n\r\n“Cái chỗ nghèo nàn này vừa chật hẹp vừa tồi tàn, con là tiểu thư nhà họ Triệu không nên sống trong cảnh khổ sở như thế này. Con nên được gọi là Triệu Mạn Tích, chứ không phải Cố Mạn Tích.”\r\n\r\nCố Sơ đeo chiếc ba lô nhỏ, dựng thẳng tai nghe ngóng cuộc nói chuyện trong nhà, trong mắt lộ vẻ khinh thường. Nếu đoán không nhầm, người trong nhà hẳn là “bà ngoại” của thân thể này, đang đến tìm mẹ của cô, Cố Mạn Tích.\r\n\r\nMột năm trước, sau một vụ nổ kinh thiên động địa, Cố Sơ xuyên vào cuốn tiểu thuyết ngược luyến đầy máu chó “Vợ Hợp Đồng Đắt Giá Của Tổng Tài”, trở thành con gái của nữ chính Cố Mạn Tích.\r\n\r\n[Trong nguyên tác, nữ chính Cố Mạn Tích sinh ra trong nghèo khó, để chữa bệnh cho mẹ mắc bệnh nặng, cô đành bất đắc dĩ bước vào vũng bùn của giới giải trí. Ông trùm hàng đầu trong giới, Tống Thâm, nam chính của truyện, phát hiện Cố Mạn Tích có gương mặt giống hệt mối tình đầu của mình.\r\n\r\nTống Thâm đề nghị trả một số tiền lớn để chữa bệnh cho mẹ Cố Mạn Tích, nhưng yêu cầu cô làʍ t̠ìиɦ nhân hợp đồng của mình. Vì muốn chữa bệnh cho mẹ, Cố Mạn Tích đã ký hợp đồng với anh ta. Trong quãng thời gian ngắn ngủi chung sống, Cố Mạn Tích dần nảy sinh tình cảm với người đàn ông nguy hiểm này.\r\n\r\nNhưng “cảnh đẹp chẳng tày gang”, mối tình đầu của Tống Thâm trở về, còn mẹ của Cố Mạn Tích cũng bệnh nặng qua đời. Trước cú sốc kép, Cố Mạn Tích, vốn tính tình nhu nhược, quyết tâm rời bỏ Tống Thâm, mang thai bỏ trốn và sinh ra con gái Cố Sơ.\r\n\r\nBi kịch vẫn chưa dừng lại ở đó. Cố Mạn Tích thực ra là thiên kim nhà họ Triệu bị thất lạc năm xưa. Sau đó, mẹ ruột của cô tìm đến, bề ngoài là muốn nhận lại con, nhưng thực chất là để ép cô kết hôn với một lão già nhà giàu khác. Ngây thơ tin tưởng mẹ ruột, Cố Mạn Tích bị lừa gả cho một gã đàn ông trung niên bệ rạc, chẳng bao lâu sau thì bị hành hạ đến chết.\r\n\r\nNhiều năm sau, Tống Thâm, người đã tìm kiếm Cố Mạn Tích trong vô vọng, tình cờ biết được người con gái anh yêu đã qua đời. Nam chính đau lòng đến mức giữ mộ cho cô suốt cả quãng đời còn lại.]\r\n\r\nNói tóm lại, đây là một cuốn tiểu thuyết ngược luyến chuẩn phong cách máu chó, và giờ đã đến hồi kết. Sắp tới, Cố Mạn Tích sẽ về nhà họ Triệu, bước chân vào con đường bi kịch.\r\n\r\nCố Sơ không đời nào để bi kịch ấy tái diễn. Trong nguyên tác, Cố Mạn Tích có kết cục thê thảm, còn con gái nhỏ của cô, Cố Sơ cũng bị chết đói.\r\n\r\nNghĩ đến đây, sự sắc bén trong mắt Cố Sơ biến mất, thay vào đó là vẻ ngây thơ đáng yêu. Cô bé hồn nhiên chạy vào nhà, giọng non nớt gọi to: “Mẹ ơi, Sơ Sơ về rồi, bụng Sơ Sơ đói quá, muốn ăn bánh sữa cơ.”', 1, 14);
INSERT INTO `book_thongtinchuongtruyen` (`id`, `ten_chuong`, `noi_dung_chuong`, `thu_tu`, `id_truyen_id`) VALUES
(33, 'Bảo bối năm tuổi (2)', 'Từng là hacker hàng đầu, giờ lại biến thành một đứa bé năm tuổi ngây ngô, chờ người nuôi nấng.\r\n\r\nCố Sơ trong lòng che mặt, cảm thấy thật mất mặt, không biết giấu đi đâu cho hết.\r\n\r\nNgay khi Cố Sơ năm tuổi chạy vào, tiếng trò chuyện trong phòng lập tức ngừng bặt.\r\n\r\nTrong phòng có hai người phụ nữ. Một người ăn mặc giản dị, khuôn mặt thanh tú là Cố Mạn Tích; người còn lại là một phụ nữ trung niên mặc bộ váy hè hàng giới hạn của Dior, trang điểm tinh tế – chính là Đường Xuân Tú, mẹ ruột của Cố Mạn Tích.\r\n\r\nĐường Xuân Tú sững người, nhìn chằm chằm vào Cố Sơ, biểu cảm vô cùng kinh ngạc.\r\n\r\nCố Sơ nắm lấy tay Cố Mạn Tích, giả vờ ngây thơ hỏi: “Mẹ ơi, bà lão này là ai vậy?”\r\n\r\nSắc mặt Đường Xuân Tú lập tức đen lại, vẻ mặt hung ác nham hiểm.\r\n\r\nBà lão? Con nhóc này dám gọi mình là bà lão?\r\n\r\nBà ta chưa đến năm mươi tuổi, suốt bao nhiêu năm nay luôn chú trọng giữ gìn nhan sắc, nhìn lắm cũng chỉ như ba mươi mấy tuổi thôi. Thế mà con nhóc này dám gọi bà ta là bà lão!\r\n\r\nCố Mạn Tích vội vàng kéo tay Cố Sơ, dịu giọng dỗ dành: “Sơ Sơ, đây là bà ngoại của con. Ngoan nào, gọi bà ngoại đi.”\r\n\r\nCố Sơ cong cong đôi mắt, đặt chiếc ba lô hồng phấn xuống, giọng non nớt gọi: “Con chào bà ngoại.”\r\n\r\nChiếc ba lô hồng phấn được đặt trên sofa, khóa kéo hé ra một khe hở nhỏ, để lộ góc của chiếc máy tính màu đen bên trong. Nhưng chẳng ai để ý đến chi tiết này.\r\n\r\nĐường Xuân Tú cố gắng giữ vẻ phong thái quý phái của mình, gương mặt được chăm sóc cẩn thận nở nụ cười thân thiện, dò hỏi: “Mạn Tích, đây là con nuôi của con à?”\r\n\r\n“Không, Sơ Sơ là con gái ruột của con, năm nay năm tuổi rồi.” Cố Mạn Tích rõ ràng không muốn nói nhiều về thân thế của Cố Sơ, đây là nỗi đau trong lòng cô.\r\n\r\nĐường Xuân Tú cũng chẳng buồn hỏi thêm, trong lòng ngày càng khinh bỉ.\r\n\r\nCố Mạn Tích mới bao nhiêu tuổi, vậy mà đã có một đứa con năm tuổi! Đứa con gái này đúng là không ra gì, còn trẻ mà đã ra ngoài lăng nhăng với đàn ông, lại còn sinh ra một đứa con hoang, thật là không biết liêm sỉ, làm ô nhục danh tiếng nhà họ Triệu!\r\n\r\nĐem so với đứa con gái út Triệu Mạn Thi của bà thì đúng là khác một trời một vực. Triệu Mạn Thi thì ngoan ngoãn hiểu chuyện, dịu dàng hiền thục, đa tài đa nghệ, là một tiểu thư danh giá mà nhà họ Triệu luôn tự hào. Không ít công tử nhà giàu ở Kinh Đô muốn cưới Triệu Mạn Thi làm vợ.\r\n\r\nDù cả hai đều là con gái do mình sinh ra, nhưng Đường Xuân Tú rõ ràng thương yêu đứa con gái út hơn nhiều. Nên khi tổng giám đốc Lý của tập đoàn Lý đề xuất muốn liên hôn với nhà họ Triệu, Đường Xuân Tú vì muốn bảo vệ con gái út mà quyết định tìm lại cô con gái lớn bị thất lạc năm xưa, Cố Mạn Tích, rồi gả cho gã Lý tổng béo phệ đó.\r\n\r\n“Con ngoan, những năm qua con đã chịu khổ nhiều rồi, mẹ biết, con nhất định đã phải chịu rất nhiều vất vả.” Đường Xuân Tú với vẻ mặt dịu dàng thương tiếc, thân mật nắm lấy tay Cố Mạn Tích.\r\n\r\n“Ngày mai, mẹ sẽ cho người đến đón con về nhà họ Triệu. Sau này, sẽ không ai có thể bắt nạt con và Sơ Sơ nữa.”\r\n\r\nMột vẻ điển hình của bà mẹ hiền từ.\r\n\r\nMắt Cố Mạn Tích hơi đỏ, nước mắt lưng tròng: “Mẹ…”\r\n\r\nLà nữ chính trong tiểu thuyết ngược luyến tiêu chuẩn, những năm qua, cuộc sống của Cố Mạn Tích quả thực rất gian khổ.\r\n\r\nLần này gặp lại mẹ ruột, tình thương lâu ngày không được chạm đến bỗng bùng lên, trái tim đã chết lặng bỗng chốc như được hồi sinh, dường như cô đã tìm thấy hy vọng mới cho cuộc đời mình.\r\n\r\n“Mẹ sẽ sắp xếp mọi việc, tối nay con thu dọn đồ đạc, sáng mai tài xế sẽ đến đón hai mẹ con.” Đường Xuân Tú vỗ nhẹ tay Cố Mạn Tích, vẻ mặt đầy yêu thương. “Mẹ đi trước đây, Mạn Tích, nhớ chăm sóc bản thân.”\r\n\r\nCố Mạn Tích dịu dàng gật đầu: “Mẹ, con tiễn mẹ.”\r\n\r\nCố Mạn Tích lưu luyến tiễn Đường Xuân Tú ra xe, cô đã quên mất những chuyện hồi nhỏ. Năm năm tuổi, khi bị bắt cóc, cô đã bị sốt nặng, khiến rất nhiều ký ức bị xóa sạch.\r\n\r\nKhi Đường Xuân Tú bước lên chiếc xe sang trọng, nụ cười hiền từ trên khuôn mặt ngay lập tức biến mất.\r\n\r\nBà lấy khăn giấy ra, lau tay liên tục, như thể trên tay còn vương mùi của đứa con hoang ấy, cần phải lau sạch. Lau đi lau lại, miệng lẩm bẩm: “Con bé vô dụng, lại còn có thêm một đứa nhóc khốn nạn nữa, đúng là làm nhục gia phong. May mà năm đó ta đã bỏ nó đi.”\r\n\r\n“Lão Triệu, mai bảo tài xế đến đón họ về.” Đường Xuân Tú nhàn nhạt nói với tài xế.\r\n\r\n“Vâng, thưa phu nhân.”\r\n\r\nTâm trạng của Cố Mạn Tích rất tốt, tìm lại được người thân khiến cô cảm thấy vui vẻ hơn hẳn. Cô vốn là một người thiếu cảm giác an toàn, đã phải chịu quá nhiều cay đắng và tổn thương trong những năm qua, nên sự ấm áp hiếm hoi này lại càng khiến cô trân trọng.\r\n\r\nBuổi tối, Cố Mạn Tích làm món bánh sữa mà con gái thích nhất, hai mẹ con cùng ngồi bên chiếc bàn ăn nhỏ thưởng thức bữa tối.\r\n\r\n“Mẹ ơi, chúng ta thật sự phải đến nhà bà ngoại sao? Con thấy bà ngoại dữ lắm.” Cố Sơ ôm miếng bánh sữa, đôi mắt tròn đen láy đảo quanh, cố gắng nhắc nhở Cố Mạn Tích rằng nhà họ Triệu là một cái ổ sói.\r\n\r\nCố Mạn Tích mỉm cười: “Sơ Sơ, đó là mẹ ruột của mẹ, mẹ muốn về đoàn tụ với bà và gia đình.”\r\n\r\nCố Sơ chớp chớp mắt, giọng ngây thơ hỏi: “Mẹ ơi, mẹ sẽ tìm cho con một người bố mới à?”\r\n\r\n“Không.” Cố Mạn Tích lắc đầu, ánh mắt ảm đạm. “Cả đời này, có Sơ Sơ là đủ rồi, mẹ sẽ không lấy chồng nữa.” Mặc dù đã trốn chạy khỏi người đàn ông đó năm năm, nhưng Cố Mạn Tích chưa bao giờ quên được anh.\r\n\r\nLàm kẻ thế thân, cô đã quá mệt mỏi.\r\n\r\nGiờ đây, anh chắc hẳn đã kết hôn với người con gái mình yêu, và có một gia đình hạnh phúc, có lẽ anh đã sớm quên đi cô tình nhân rẻ mạt này rồi.\r\n\r\nCố Sơ ôm chặt miếng bánh sữa, tiếp tục dụ dỗ: “Mẹ ơi, nhà bà ngoại có nhiều tiền không?”\r\n\r\n“Nhiều lắm, cũng khá có tiếng ở Kinh Đô.” Cố Mạn Tích cảm thán, cô chưa bao giờ nghĩ rằng gia đình mà mình vô tình thấy trên TV lại chính là người thân ruột thịt của mình.\r\n\r\nCố Sơ nghiêng đầu, đôi mắt trong veo, vẻ mặt khó hiểu, tiếp tục nhắc nhở: “Mẹ à, nhà bà ngoại nhiều tiền thế, tại sao không tìm mẹ sớm hơn? Sơ Sơ đã năm tuổi rồi, bà ngoại mới đến tìm.”\r\n\r\nMẹ ơi, con đã nhắc đến thế rồi mà mẹ vẫn chưa hiểu sao?\r\n\r\nKhông có lửa làm sao có khói, cáo chúc tết gà, chẳng bao giờ là chuyện tốt!\r\n\r\nNhưng hiển nhiên Cố Mạn Tích, giống như mọi nữ chính trong truyện ngược, vừa ngây thơ lại vừa dễ tin người, bản tính lương thiện, yếu đuối. Lúc nào cũng nghĩ rằng trên đời này ai cũng tốt, bị bán rồi còn giúp người ta đếm tiền.\r\n\r\n“Sơ Sơ, mẹ là con gái ruột của bà, làm gì có chuyện mẹ sẽ hại con mình chứ?” Cố Mạn Tích xoa đầu Cố Sơ, ánh mắt tràn đầy vẻ dịu dàng bao dung. “Sơ Sơ ăn xong bánh sữa rồi nhớ làm bài tập, mẹ đi thu dọn hành lý, mai chúng ta về nhà họ Triệu.”\r\n\r\n“Với cả, Sơ Sơ, tối đừng lén dùng máy tính chơi game nữa nhé, hại mắt lắm đấy.”\r\n\r\nCố Sơ câm nín, trong lòng tràn ngập một nỗi uất ức khó nói thành lời. Mẹ à, cái tính tốt bụng thánh mẫu của mẹ cứ thấy hố là nhảy xuống thế này, bảo sao mẹ không bị ngược thảm như vậy trong tiểu thuyết.\r\n\r\nCó vẻ, đành phải tự mình cứu lấy nữ chính ngược luyến này thôi.\r\n\r\nNếu có cơ hội, Cố Sơ còn muốn tìm gã cha chó kia, dạy cho một bài học ra trò!\r\n\r\n---\r\n\r\nSáng sớm hôm sau, một chiếc xe van đến đỗ trước cổng nhà Cố Sơ, đón hai mẹ con lên đường đến Kinh Đô.\r\n\r\nNgay sau khi họ rời đi, một chiếc xe màu đen từ từ dừng trước cửa nhà Cố Sơ. Cửa xe mở ra, một người đàn ông trông giống trợ lý bước xuống, gõ cửa thăm dò nhưng không có kết quả rồi quay lại.\r\n\r\n“Thiếu gia, họ đã dọn đi rồi.” Người trợ lý cung kính báo cáo.\r\n\r\nTrong chiếc xe màu đen tuyền, người đàn ông bí ẩn khẽ động ngón tay, màn hình máy tính hiện lên hình ảnh chụp hai mẹ con Cố Mạn Tích.\r\n\r\n“Xác nhận là cô ta có một đứa con gái?” Người đàn ông hỏi, giọng điệu lạnh nhạt, hờ hững như tuyết vừa tan trên đỉnh núi cao, băng giá vô tình.\r\n\r\nTrợ lý trả lời: “Xác nhận, sau khi rời khỏi làng giải trí, Cố Mạn Tích đã ẩn mình suốt năm năm. Cô bé đó là con ruột của cô ấy.”\r\n\r\nNgười đàn ông thở dài, ánh mắt phức tạp. Ánh nhìn dừng lại hồi lâu trên khuôn mặt đẹp như trăng rằm của Cố Mạn Tích, dường như muốn tìm lại bóng dáng của một người khác trong đó.', 2, 14),
(34, 'Trở về Kinh Đô (1) ', 'Ánh mắt của người đàn ông lại dừng trên cô bé xinh xắn năm tuổi đang đứng bên cạnh cô.\r\n\r\nMột tiếng thở dài đầy bất lực.\r\n\r\nEm có biết không, anh đã tìm em bao lâu, vậy mà em lại có cả con rồi.\r\n\r\nEm còn nhớ anh không?\r\n\r\n“Cử người theo dõi mọi động tĩnh của hai mẹ con họ.”\r\n\r\nNgười đàn ông như chợt nghĩ đến điều gì đó, khuôn mặt vốn luôn lạnh lùng bỗng xuất hiện chút ý cười, đôi môi mỏng khẽ nhếch: “Cô ta rất cẩn thận, nhớ giữ khoảng cách với cô ta.”\r\n\r\nTrợ lý nghe vậy, cổ họng như nghẹn lại, vội vàng đáp: “Vâng, thiếu gia.”\r\n\r\nBên này, Cố Sơ hoàn toàn không hay biết đã có người đến thăm dò nhà mình.\r\n\r\nGiờ đây, cô vẫn phải tiếp tục giả vờ làm một đứa bé năm tuổi, ngoan ngoãn rúc vào lòng mẹ, đôi mắt to tròn đen láy ngây thơ dõi theo cảnh vật bên ngoài thành phố.\r\n\r\n“Mẹ ơi, bên ngoài có nhiều xe quá, wow, chiếc xe kia đẹp quá!” Cố Sơ tỏ vẻ như một đứa trẻ chưa từng thấy cảnh thành phố hoa lệ, kinh ngạc xuýt xoa.\r\n\r\nAi mà biết được, kiếp trước cô từng bị một gã khốn kiếp đuổi gϊếŧ khắp nửa vòng trái đất, cái gì cũng từng thấy, cái gì cũng từng chơi qua.\r\n\r\nCố Mạn Tích ôm chặt con gái, nở nụ cười dịu dàng: “Sơ Sơ à, đây là thành phố lớn, tất nhiên sẽ có rất nhiều xe rồi.”\r\n\r\n“Ồ, Sơ Sơ thích xe lắm, thị trấn của mình chỉ toàn xe đạp với xe ba gác thôi, Sơ Sơ rất ít khi thấy xe bốn bánh.” Cố Sơ giả bộ nói bằng giọng ngây ngô.\r\n\r\nNgười tài xế phía trước liếc nhìn hai mẹ con ăn mặc đơn giản qua gương chiếu hậu, trong lòng không khỏi cảm thán. Không ngờ tiểu thư nhà họ Triệu bị thất lạc năm xưa lại có một đứa con... ngốc nghếch như thế này.\r\n\r\nCha đứa bé cũng không rõ tung tích.\r\n\r\nChuyện chưa cưới đã sinh con như thế này, đối với hào môn chắc chắn là một vết nhơ.\r\n\r\nNghĩ đến đây, trong lòng tài xế càng thêm khinh thường, nhưng ngoài mặt vẫn cố giữ vẻ kính trọng: “Thưa tiểu thư, cô có thể chợp mắt một chút trên xe. Chúng ta còn vài tiếng nữa mới tới Kinh Đô.”\r\n\r\n“Cảm ơn chú Vương.” Cố Mạn Tích vẫn giữ dáng vẻ dịu dàng, ôn nhu, chẳng hề thấy việc ngồi trên chiếc xe cũ kỹ đi Kinh Đô có gì không ổn.\r\n\r\nNgược lại, Cố Sơ ngẩng đầu lên khỏi ngực mẹ, mím nhẹ đôi môi hồng hào, ấm ức hỏi: “Chú tài xế, bà ngoại thật sự thích Sơ Sơ và mẹ sao?”\r\n\r\nNgười tài xế ngẩn ra, nhớ lại lời dặn của phu nhân, vội vàng gật đầu: “Tất nhiên rồi, tiểu thư là con gái ruột của bà ấy. Tìm lại được người con thất lạc bao năm, bà ấy vui lắm, cả nhà họ Triệu đều chào đón tiểu thư về.”\r\n\r\nÁnh mắt Cố Mạn Tích hiện lên ý cười.\r\n\r\nCố Sơ bĩu môi, giọng trẻ con nhưng câu từ lại rành mạch: “Bà ngoại đã thích mẹ và Sơ Sơ như vậy, tại sao không cho người lái máy bay đến đón chúng ta nhỉ? Sơ Sơ xem tivi thấy từ đây đến Kinh Đô, ngồi máy bay chỉ mất có hai tiếng thôi mà.”\r\n\r\nCố Sơ còn nhỏ tuổi nhưng nói năng rất rành rọt, không giống những đứa trẻ cùng tuổi thường nói ngọng, chỉ có giọng nói vẫn còn non nớt, nghe vô cùng dễ thương.\r\n\r\nTay Cố Mạn Tích đang vuốt ve con gái bỗng khựng lại, đôi lông mày thanh tú khẽ nhíu. Cô không ngờ đến chuyện này.\r\n\r\nTài xế cũng không ngờ một đứa trẻ năm tuổi lại hỏi câu như vậy, nhất thời không biết phải trả lời ra sao, chỉ có thể ngượng ngùng đáp: “Chắc... chắc tại hết vé rồi. Vé máy bay đi Kinh Đô luôn rất khó mua.”\r\n\r\n“Ồ, thì ra là thế, Sơ Sơ hiểu rồi.” Cố Sơ liếc nhìn mẹ, thầm nghĩ: Con đã nhắc nhở đến mức này rồi, mẹ cũng nên nhận ra điều bất thường đi chứ!\r\n\r\nCố Mạn Tích không phải kiểu phụ nữ chưa từng trải đời. Cô đã từng hoạt động trong làng giải trí, từng làʍ t̠ìиɦ nhân cho các ông lớn, nên tất nhiên biết rằng việc đặt vé máy bay chưa bao giờ là khó khăn.\r\n\r\nGhế hạng VIP, bao giờ chẳng có sẵn chỗ.\r\n\r\nThậm chí, nhà họ Triệu ở Kinh Đô nổi tiếng giàu có, nào thiếu gì máy bay tư nhân, thiếu gì xe sang?\r\n\r\nNếu Đường Xuân Tú thực sự mong mỏi gặp lại con gái, nếu nhà họ Triệu thật sự chào đón Cố Mạn Tích nhận tổ quy tông, sao lại chỉ cử một chiếc xe cũ nát đến đón, cố gắng giấu diếm như thế để đưa hai mẹ con về Kinh Đô?\r\n\r\nNghĩ đến đây, trong lòng Cố Mạn Tích cuối cùng cũng dấy lên vài phần lo lắng, cô siết chặt tay ôm con gái, dường như bắt đầu nhận ra có điều gì đó không ổn.\r\n', 3, 14),
(35, 'Cậu có tim không vậy? ', 'Tống Trường An nghe thấy động tĩnh bên ngoài, cậu cẩn thận từng chút ló đầu ra muốn nhìn xem rốt cuộc bên ngoài xảy ra chuyện gì.\r\n\r\nCậu mơ hồ nghe được cái gì mà \"Ấu tể\", nhưng lần này chắc là không phải nói cậu đâu ha? Nên khi nãy chắc là cậu nghe nhầm rồi.\r\n\r\nVì thế Tống Trường An cố sức đẩy chướng ngại vật trên đầu mình ra rồi khẽ meo meo vươn nửa cái đầu ra vậy mà liền đối diện thẳng tắp với hai con người khổng lồ, thời điểm cậu nhìn hai người họ thì hình như hai người đó cũng đang nhìn cậu, đồng tử cậu mạnh mẽ co rút, một loại cảm giác sợ hãi khó tả nháy mắt tràn ngập não cậu làm cậu run run rẩy rẩy rụt trở về.\r\n\r\nTống Trường An:\"Ô ô ô ô...\"\r\n\r\nNếu biết trước thì cậu đã không nhìn rồi, đây rốt cuộc là đâu? Tại sao lại đáng sợ quá vậy!?\r\n\r\nCậu như là đi nhầm vào thế giới của người khổng lồ, bất cẩn một chút liền sẽ bị đè chết.\r\n\r\nNhưng vào lúc cậu dựa vào ánh sáng mơ hồ chiếu xuống từ trên đỉnh đầu nhìn rõ tay của mình cậu lại rơi vào trầm tư.\r\n\r\nCậu chắc chắn là đang nằm mơ, nếu không thì sao có thể nhìn tay mình thành móng vuốt được chứ?\r\n\r\nMột lớp lông tơ mỏng bao trùm lấy tay cậu, đầu ngón tay còn có một đoạn móng dài nhọn bán trong, đầu ngón tay phấn nộn theo từng cử động của cậu mà nhúc nhích, chỉ có bốn ngón, nhìn kiểu gì thì đây cũng không phải tay người.\r\n\r\nTống Trường An: \".....\"\r\n\r\nCậu hình như đã biến thành Hamster lông vàng của em họ cậu rồi...\r\n\r\nCậu ngồi bệt xuống đất rồi thành công thấy được hai chân và cái bụng héo queo của mình, lông tơ trắng mịn cùng với màu vàng óng bọc lấy người cậu.\r\n\r\nTống Trường An: \".....\"\r\n\r\nCậu thật sự biến thành Hamster lông vàng, cậu nhớ rõ bé Hamster của em họ chính là màu này.\r\n\r\nCùng lúc đó cảm giác đói bụng mãnh liệt truyền tới, Tống Trường An cuộn người thành cục bông nhỏ rúc vào một góc.\r\n\r\nXung quanh thật thối, bụng thật đói, đột nhiên đang là người lại biến thành chuột, Tống Trường An cảm thấy bản thân cần thời gian để thích ứng với hiện thực một chút, nếu không thì cậu sợ bản thân sẽ tủi thân mà khóc mất.\r\n\r\nCậu vậy mà lại bị một chiếc xe đạp điện đâm thành một con Hamster như vậy!\r\n\r\nThật ra thì cặp mắt nho nhỏ như hạt đậu kia của cậu đã chứa đầy nước mắt, chỉ cần ai đó khẽ chạm nhẹ một cái là sẽ liền rơi xuống.\r\n\r\nBên ngoài hộp, Arnold, Sean quan sát cậu cả nửa ngày trời vẫn chưa hồi phục lại tinh thần.\r\n\r\n\"Lông tơ....\" Arnold mất một lúc lâu mới có thể mở miệng, trong giọng nói mang theo sự nghi hoặc khó tin, dù có là người luôn bình tĩnh như hắn thì hiện tại vẫn chưa thể nháy mắt mà tiếp thu được.\r\n\r\nCon người trong quá trình tiến hoá gần như đã mất đi năng lực sinh sản, gen dã thú trên người họ cũng giống như những năm tháng dài đẵng đẵng kia trôi qua rồi mất đi sự mềm mại ấm áp vốn có.\r\n\r\nToàn bộ lông tóc đều mất đi sự mềm mại, thay vào đó là trở thành một thứ gì đó cứng rắn như sắt thép, ngay cả các ấu tể mới sinh cũng vậy, lúc ở trong bụng mẹ lông trên người chúng còn có chút mềm mại, nhưng chỉ cần rời khỏi cơ thể mẹ thì chỉ vài phút sau liền có thể trở nên cứng cáp vô cùng.\r\n\r\nẤu tể chưa có năng lực khống chế lông tóc bên ngoài cơ thể, và sự mất khống chế đó làm cho chúng dù có ở trong hoàn cảnh nguy hiểm thế nào vẫn có thể sống sót.\r\n\r\nNhưng ấu tể trước mắt bọn họ này lại có một thân toàn lông tơ quá mức mềm mại thậm chí còn bết dính lại với nhau vì thấm nước, nó chính là ấu tể vừa yếu đuối vừa mềm mại mà mọi người mong muốn nhìn thấy nhất.\r\n\r\nTrong mắt Arnold hiện tại chỉ chứa mỗi cậu.\r\n\r\nHắn nhìn ấu tể sợ hãi co rúc thành một cục trong góc, sống lưng run rẩy giống như do hoàn cảnh ác liệt này mà khó chịu, trái tim hắn như thắt lại.\r\n\r\n\"Sean, thay đổi địa điểm, không về nhà nữa, nhanh chóng liên hệ tiến sĩ Keikatsu, chúng ta tới viện nghiên cứu khoa học.\" Arnold nhanh chóng nói.\r\n\r\nHắn và Sean đều không có chút kinh nghiệm chăm sóc ấu tể, huống chi trước mặt họ không phải ấu tể trân quý lại \"Yếu ớt\" như trong trí nhớ của bọn họ, so với hiểu biết của hắn còn muốn yếu ớt hơn, thậm chí lông tóc cứng rắn để bảo vệ bản thân cũng không có.\r\n\r\nHai người họ cần phải nhanh chóng đem nó đến tay của người chuyên nghiệp để tránh xuất hiện chuyện ngoài ý muốn.\r\n\r\nSean vẫn như cũ ngốc lăng tại chỗ bị hắn đánh thức, bước nhanh tới khoang điều khiển thay đổi địa chỉ đồng thời liên hệ người bên viện nghiên cứu khoa học.\r\n\r\nTiến sĩ Keikatsu vừa mới kết thúc một hồi thực nghiệm không có thu hoạch, trực tiếp vứt hết hình tượng mà nằm bẹp trên ghế, mấy người trợ lý bên cạnh cũng ủ rũ cụp đuôi.\r\n\r\nHọ gánh vác hy vọng cuối cùng của cả đế quốc, tiêu hao vô số tài nguyên và tiền bạc vẫn không thể kéo cao tỉ lệ sinh sản của đế quốc lên được nửa phần.\r\n\r\nNguyên nhân duy nhất mà họ xác định được là do hiện giờ con người quá mức lớn mạnh, lớn mạnh tới mức không có cách nào sinh sản được.\r\n\r\nNhiều năm trôi qua, coi trọng người mạnh là nguyên tắc duy nhất. Nhưng người mạnh, ngay cả gen của họ cũng đánh nhau, gen của hai bên cha mẹ cắn nuốt lẫn nhau thành ra xác xuất mang thai một đứa trẻ gần như bằng không.\r\n\r\nNói cách khác, hai bên cha mẹ phải một bên mạnh một bên yếu thì xác xuất mang thai cao hơn rất nhiều, nhưng nguy hiểm thì lại theo đứa trẻ đang dần lớn lên mà tới gần.\r\n\r\nẤu tể trong cơ thể mẹ dần trở nên mạnh mẽ, tốc độ lớn của chúng rất nhanh, nhưng trước khi cơ thể phát triển hoàn toàn thì chúng không thể rời khỏi cơ thể mẹ, dinh dưỡng cũng không được mất đi, có thể thấy được sinh mạng của người mẹ phải chịu uy hϊếp lớn như thế nào khi mang thai một đứa trẻ vì ấu tể trong bụng họ có thể sẽ đâm thủng bụng họ bất cứ khi nào, trở thành một xác hai mạng người.\r\n\r\nẤu tể sinh ra vào 20 năm trước, trên người cũng đã có dự triệu này, hôm nay, hai mươi năm sau, trường hợp tàn khốc như vậy Keikatsu không dám nhớ lại.\r\n\r\nMang thai ngoài cơ thể không phải không có người nghĩ đến, có rất nhiều phòng thí nghiệm tư nhân đều đang nghiên cứu cái này, Đế quốc đối với chuyện này luôn có thái độ cổ vũ, chỉ cần mấy người làm theo quy định và thủ tục đầy đủ đều sẽ được chính phủ đế quốc duy trì viện trợ, mà quy định và thủ tục này đều cực kì đơn giản.\r\n\r\nNói đến loại nghiên cứu này, trạm kiểm soát đế quốc thiết lập vốn hẳn là cực kì nghiêm ngặt, nhưng nghiên cứu thụ tinh bên ngoài cơ thể xác suất lại bằng không, đế quốc tỏ vẻ: mấy người thử đi, có nghiên cứu được cái gì thì chúng tôi lại còn phải cảm ơn mấy người quá.\r\n\r\nChính sách rộng rãi quá mức cũng tỏ rõ tình thế cấp bách hiện giờ, nếu còn như vậy thì không cần chờ đám sâu bọ ngoài hành tinh đó xé mở biên phòng của bọn họ, loài người trực tiếp tự mình diệt sạch.\r\n\r\nNhưng chỉ cần nghĩ đến hàng xóm láng giềng Liên Bang, thời gian họ chưa có thêm ấu tể đã qua hơn 30 năm, Keikatsu nghĩ vậy liền thấy có vài phần đắc ý.\r\n\r\nKeikatsu vẫy vẫy tay vừa lúc lão đang muốn kêu nhóm trợ lý cùng lão làm việc cả đêm trở về nghỉ ngơi thì quang não của lão đột nhiên vang lên.\r\n\r\n\"Sean? Đây không phải là Phó quan của Arnold sao?\" Keikatsu lầu bầu nhận tín hiệu, \"Tiểu tử nhà cậu có chuyện gì? Bộ xương già này của lão đều mệt muốn chết rồi, muốn nghỉ ngơi.\"\r\n\r\n\"Tiến sĩ Keikatsu! Bọn cháu phát hiện một con ấu tể ở đây, đang trên đường đến viện nghiên cứu khoa học!\" Sean kêu.\r\n\r\n\"Ui da mệt chết tôi rồi, tôi... Ấu tể? Cái gì ấu tể!?\" Keikatsu tưởng mình nghe nhầm, suýt nữa nhảy dựng cả lên, gương mặt già của lão trực tiếp nhào vào màn hình, hận không thể chui cả người vào.\r\n\r\nKhông trách được lão kích động như vậy, bản thân lão nghiên cứu chính là cái này, đối với ấu tể trân quý đương nhiên là cực kì để tâm.\r\n\r\nĐến cả mấy người trợ lý ở bên cạnh lão cũng nghe thấy mà vọt tới chỗ lão với tốc độ cực nhanh, xíu nữa là đẩy lão Keikatsu ra ngoài luôn. Lão không rảnh để tức giận, Keikatsu cố giữ lại chỗ của mình gấp gáp nói: \"Ấu tể đâu? Đâu rồi? Mau đưa tôi xem nó!\"\r\n\r\nLão bây giờ chỉ có thể nhìn thấy cái xe bay của Arnold và mặt của Phó quan Sean, tiểu tử này mới thành niên không lâu, trước kia cũng là đối tượng được nhiều người cưng sủng nhưng đối với Keikatsu mà nói thì ấu tể trưởng thành không thể nào so với ấu tể còn nhỏ được.\r\n\r\nMấy người khác cũng thế, các nữ sĩ ngày thường mặt mày tươi cười tán tỉnh các anh đẹp trai phong độ nhẹ nhàng giờ lại mang một vẻ mặt dữ tợn khác hoàn toàn bình thường uy hϊếp Sean nếu còn chậm một giây một phút nào nữa thì sẽ từ trong ánh sáng của quang não bò ra xé xác cậu.\r\n\r\nSean: \".....\"\r\n\r\nSean bị đuổi đến cạnh cái hộp, mấy người kia lúc này mới thấy được cảnh tượng trong hộp.\r\n\r\nẤu tể nho nhỏ có bộ lông vàng óng còn hơi ẩm ướt rúc thành cục bông giữa đống bông và mùn cưa lộn xộn chỉ lộ ra hai cái tai màu xám nhỏ cụp lại đang đưa lưng về phía họ mà run bần bật.\r\n\r\n\"Trời ơi!\"\r\n\r\nAm thanh kinh ngạc hết lần này đến lần khác vang lên, dù có là ai đi chăng nữa thì cũng sẽ không nghĩ tới bọn họ ở ngay đây lại thấy một ấu tể độc lạ đến vậy.\r\n\r\n\"Lông của nó còn ướt, còn chưa cứng lại, không phải là bị.....\" Rất nhanh liền có người thắc mắc.\r\n\r\nThật sự thì ấu tể này mang bộ dáng cực kì giống như mới bị mổ ra từ bụng mẹ, nếu ấu tể chưa phát triển hoàn toàn mà bị lấy ra khỏi cơ thể mẹ thì trên lý thuyết lông của nó sẽ không cứng lại.\r\n\r\n\"Không phải.\" Keikatsu lắc đầu, đôi mắt lão lúc này càng ngày càng sáng quắc, \"Nếu bị mổ ra từ bụng mẹ thì sẽ không sống được vài phút nhưng nó thì còn sống, nó không giống các ấu tể khác.\"\r\n\r\nẤu tể có bộ lông mềm mại độc nhất vô nhị, tuy tình trạng không quá tốt nhưng Keikatsu vẫn sinh ra một chút hy vọng.\r\n\r\nTống Trường An nghe được tiếng động, tai nhỏ không tự chủ mà lắc lư.\r\n\r\nKeikatsu nhìn chằm chằm chắc chắn rằng ấu tể còn ổn mới liền chuyển mắt đến phía Arnold đứng ở một bên.\r\n\r\n\"Arnold!!\"\r\n\r\nArnold đang ngẩn ngơ nhìn chằm chằm mông nhỏ của ấu tể bất thình lình bị gọi tỉnh, hắn quay đầu nhìn tiến sĩ Keikatsu trên màn hình.\r\n\r\n\"Cậu đọc nhiều sách như vậy mà sao giờ lại ngu thế? Mấy thứ lão dạy cậu có phải giờ cậu đều đã quên rồi không? Không ngờ cậu lại để ấu tể ở chỗ như thế này! Cậu muốn để nó bệnh chết sao? Hả??\"\r\n\r\nArnold nghĩ lại vừa rồi ấu tể vừa nhìn thấy hắn liền sợ tới mức co rúm lại mà lòng hụt hẫng, không thanh minh nửa lời.\r\n\r\nSean cố giải thích một chút: \"Tiến sĩ Keikatsu, tiểu ấu tể là do Thiếu tướng ngài ấy vô tình phát hiện ra.\"\r\n\r\nTống Trường An nghe được: Thiếu tướng? Đây rốt cuộc là đâu vậy? Có vẻ họ sẽ không làm hại mình, có phải mình an toàn rồi không?\r\n\r\nNghĩ đến đây Tống Trường An thả lỏng đôi chút, cơ thể cũng không căng thẳng như trước nữa, ở nơi cậu không thấy, cái đuôi nhỏ phấn nộn hơi nhếc lên, cuối cùng thì từ trong bộ lông mềm chui ra.\r\n\r\nArnold vẫn luôn nhìn chằm chằm cậu, hầu kết khẽ lăn, tầm mắt đảo qua cái đuôi của cậu đang lắc lư qua lại.\r\n\r\nKeikatsu ở viện nghiên cứu khoa học vẻ mặt hận sắt không thành thép nhìn Arnold mắng: \"Cậu không thấy nó lạnh sao? Cả người đều phát run kìa! Cậu còn để ấu tể ở đó nữa ư? Arnold, cậu có tim không vậy? Còn không mau bế nó lên!!\"\r\n\r\nArnold không có tim: \".....\"\r\n\r\nTống Trường An giỏng tai nghe một hồi: \"..... Bế lên? Mình sao?\"\r\n\r\nTống Trường An không dám quay người nên không thấy Arnold phía sau cậu chần chừ một hồi rốt cuộc cũng duỗi tay qua chuẩn bị bế tiểu ấu tể lên.\r\n\r\nMột lát sau, Tống Trường An giật nảy mình thét lên một tiếng, bốn móng vuốt ở giữa không trung quơ loạn một hồi nhanh chóng vọt vào sâu trong đống cỏ bên cạnh.\r\n\r\nNgón tay Arnold vừa chạm vào mông tiêu ấu tể:\".....\"\r\n\r\nChui vào đống mùn cưa, bé Hamster lông vàng đem bản thân giấu đi, rầm rì: Chẳng trách lúc trước Niệm Niệm nói bé Hamster của cô bé mới nuôi đặc biệt sợ người, lúc nào cũng chạy, đổi lại là cậu thì cậu cũng chạy!!\r\n\r\nMột đám người bự như vậy, nhìn thôi cũng đủ doạ người, lại còn vây quanh cậu lải nha lải nhải, động tay động chân.\r\n\r\nBế thì bế đi, tự nhiên lại còn chọt mông cậu làm gì!\r\n', 2, 13),
(36, 'Trong tay Thiếu tướng là cái gì?', '\"Tôi doạ nó sợ rồi.\" Arnold thu tay lại, nhẹ giọng nói.\r\n\r\nĐầu ngón tay hắn còn dư lại cảm giác mềm mại ấm áp, Arnold mân mê ngón tay, trong lòng gào thét hai chữ —— mềm quá.\r\n\r\nHắn chưa từng thấy ấu tể nào mềm như vậy, tựa như chỉ cần chạm nhẹ một cái cũng khiến nó bị thương vậy, ấu tể sợ hãi cũng đúng thôi.\r\n\r\nHắn có phần tự trách.\r\n\r\nArnold không dám sờ nó nữa, rất nhanh sau đó hắn đã bị Keikatsu mắng cho bay màu.\r\n\r\n\"Lão bảo cậu bế nó lên chứ không bảo cậu doạ nó! Tay cậu không nhẹ nhàng một chút được à? Cậu đúng là thứ phế vật, học hành chả ra làm sao cả!\" Keikatsu vẻ mặt hận sắt không thành thép.\r\n\r\nArnold:\".....\"\r\n\r\nKeikatsu đau lòng nhào vào màn hình, đôi mắt nhìn chằm chằm nửa cái sống lưng của tiểu ấu tể lộ ra nói: \"Bé đáng yêu, con cố chịu một chút, chút nữa đến chỗ ông, ông tự mình chăm sóc con!\"\r\n\r\nThái dương Arnold giật giật nổi gân xanh, đây là tiểu ấu tể hắn tìm được, dựa vào cái gì phải để người khác chăm sóc?\r\n\r\nTrầm mặc một lúc, hắn lần nữa vươn tay, cẩn thận gỡ bông gòn và mùn cưa trong góc nơi tiểu ấu tể đang trốn kia ra.\r\n\r\nHơi nước làm hai thứ này dính vào nhau, Arnold cảm giác thấy khi sờ lên vừa lạnh vừa có chút cộm tay, da ấu tể mỏng như vậy thật sự có thể chịu được sao?\r\n\r\nRốt cuộc là ai mang ấu tể ném ở đây?\r\n\r\nBông gòn và mùn cưa bị gạt ra, thân hình của ấu tể liền hoàn toàn lộ ra trước mắt Arnold, lông tơ bết lại, dính sợi bông làm lộ ra làn da hồng nhạt phía dưới, nhìn qua trông cực kì chật vật.\r\n\r\nẤu tể vẫn luôn đưa lưng về phía hắn, dù nghe được âm thanh phía sau nhưng vẫn cố chấp run bần bật rúc vào trong góc, chỉ có hai cái tai nhỏ màu xám trên đầu nhúc nhích như thể đang lắng nghe động tĩnh xung quanh.\r\n\r\nArnold nhẹ nhàng gõ đáy hộp hai cái, hắn vui vẻ vì khi nãy bản thân chạm tới ấu tể doạ nó sợ hãi nên hắn mới hốt hoảng như vậy.\r\n\r\nLần này phải từ từ.\r\n\r\nQuả nhiên lần này ấu tể vẫn còn có chút run rẩy, hai tai dựng thẳng lên, nhanh chóng xoay người lại, tràn ngập đề phòng nhìn chằm chằm hắn.\r\n\r\nĐôi mắt nhỏ đen nhánh, chóp mũi kiều nộn cùng miệng nhỏ hồng nhạt, Arnold lắng nghe tiếng rầm rì nhỏ xíu của nó, chầm chậm đưa tay đến trước mặt nó.\r\n\r\nTống Trường An vẫn luôn chú ý động tĩnh phía sau nhưng vẫn bị hoảng sợ mà xụt xịt mũi, hai mắt đẫm lệ mông lung ngẩng đầu nhìn qua lại phát hiện mình chỉ có thể nhìn rõ ngón tay duỗi đến trước mặt mình, chủ nhân ngón tay lớn thế nào thì lại nhìn không rõ, chỉ thấy một bóng dáng mơ hồ.\r\n\r\nMũi vẫn là mũi, mắt vẫn là mắt nhưng ghép lại với nhau lại thành một đám mơ hồ.\r\n\r\nTống Trường An: Mình hình như sắp mù rồi, không thì sao lại nhìn không rõ chứ...\r\n\r\nNhưng chóp mũi cậu vẫn có thể ngửi được một mùi hương hoàn toàn khác với mùi hôi xung quanh, mùi hương mát lạnh thoang thoảng, cũng không thể nói là thơm được nhưng lại nháy mắt mang cậu từ trong mùi hôi thối ẩm ướt kia cứu ra.\r\n\r\nBàn tay kia toả ra nhiệt độ ấm áp như có thể dễ dàng đem cậu từ hoàn cảnh ẩm ướt lạnh lẽo kia kéo ra, cậu rùng mình một cái, cảm giác mình bị thứ nhiệt độ này mê hoặc.\r\n\r\nCậu nhịn không được bò lên phía trước hai bước nhưng rồi vẫn lại dừng ở đó run rẩy không dám tiến lên phía trước.\r\n\r\nBởi vì lí do không gì khác chính là sự chênh lệch về kích cỡ làm cậu có cảm giác áp bách quá lớn.\r\n\r\nTầm mắt của Tống Trường An chỉ có thể nhìn thấy bàn tay hắn so với cả người hắn còn to hơn nữa, đầu ngón tay xinh đẹp, ngón tay thon dài, chỉ một ngón tay thôi cũng có thể dễ dàng chọt chết cậu, phía sau bàn tay là bóng người mơ hồ tựa như núi cao đem cậu che khuất hoàn toàn, cậu gắt gao áp chế du͙© vọиɠ muốn lại gần của mình.\r\n\r\nTống Trường An khóc chít chít, nhát như chuột nghĩa là gì cậu rốt cuộc cũng đã hiểu rõ rồi, loại chênh lệch kích thước gấp trăm ngàn lần này mang đến cho cậu uy hϊếp cực lớn khiến cậu run như cầy sấy nhắm chặt đôi mắt không dám nhìn cũng không dám động đậy nữa.\r\n\r\nArnold nhìn tiểu ấu tể ngẩng đầu nhìn hắn một cái lại như bị doạ đến nỗi mắt nhắm chặt lại, cả người bất động hoá đá, muốn tới gần thân nhiệt ấm áp kia, ấu tể len lén ti hí mắt ra nhìn.\r\n\r\nẤu tể đang sợ hãi, nó lạnh, cố gắng kìm nén nỗi sợ muốn tới gần hắn.\r\n\r\n\"Đừng sợ, tôi không hại em.\" Giọng nói của Arnold chầm chậm lại, nỗ lực làm cho nó trở nên ôn nhu vô hại.\r\n\r\nTống Trường An lặng lẽ mở mắt, mím môi nghe nghe hắn nói, giọng mói này nghe có vài điểm gượng gạo nhưng có vẻ khá đáng tin, nó không khác những gì Niệm Niệm nhà cậu nói với Hamster mỗi lần muốn đưa tay bế nó.\r\n\r\nTống Trường An: Tôi thấy anh giống đang lừa tôi thì có.\r\n\r\nNhưng không ngờ giây tiếp theo, cậu thấy ngón tay to lớn trước mặt đột nhiên lại gần cậu, động tác đột ngột làm cậu lùi lại hai bước sau đó mông dính vào góc hộp.\r\n\r\nTống Trường An nước mắt lưng tròng không có cách nào lùi lại nữa, nhắn mắt không dám nhúc nhích, cậu mơ hồ cảm nhận được người trước mắt vô hại nhưng vì bản năng bẩm sinh làm cậu sợ hãi không thể bỏ qua bất kì động tác nào của đối phương, cậu run rẩy chờ vận mệnh tuyên án.\r\n\r\nĐầu ngón tay vừa chạm vào thân thể của ấu tể, nó mãnh liệt run lên một lúc sau đó liền bất động giả chết, Arnold không khỏi nín thở tiếp tục duỗi tay ra.\r\n\r\nTiến sĩ Keikatsu cùng những người khác lúc nãy còn ở một bên ồn ào cũng đồng loạt im lặng hồi hộp dõi theo từng cử chỉ của Arnold, tiểu ấu tể trước mắt họ thật sự rất nhát gan, một chút động tĩnh cũng có thể doạ đến nó.\r\n\r\nNgón tay ấm áp cọ qua cằm Tống Trường An, duỗi tới phía bụng cậu, độ ấm từ ngón tay làm Tống Trường An cảm thấy cực kì thoải mái, cậu run rẩy, ngoan ngoãn thuận theo bàn tay mà bò lên tay hắn.\r\n\r\nÝ chí mỏng manh làm cậu nằm lên lòng bàn tay Arnold không chút phản kháng, Tống Trường An thở phào nhẹ nhõm, \"Cái máy sưởi này thật thoải mái.\"\r\n\r\nArnold chỉ có thể nghe được tiếng ấu tể rầm rì, cẩn thận đem con chuột nhỏ bế lên, chỉ khi đặt trên lòng bàn tay mới ý thức được rằng ấu tể thật sự quá mức nhỏ yếu. Arnold chỉ cảm nhận được chút trọng lượng nhỏ bé trên lòng bàn tay, lòng hắn như thắt lại, một tay khác hắn chắn lại ở phía sau ấu tể đề phòng cậu đột nhiên ngã xuống.\r\n\r\nDưới sự bao bọc bởi nhiệt độ ấm áp, hơi ẩm trên người Tống Trường An rất nhanh đã biến mất, những sợi lông dần bung ra bay tán loạn, cậu híp mắt, lúc trước xảy ra kinh sợ, hiện giờ đã an toàn, mệt mỏi bủa vây lấy cậu, cậu nỗ lực nâng đầu nhỏ lên một chút rồi cuối cùng kê đầu lên lòng bàn tay ấm áp ngủ thϊếp đi.\r\n\r\nẤu tể trên tay hắn ngủ mất rồi, có lẽ là trước đó bị kinh hách mà hiện giờ nó ngủ cũng không được ngon, cơ thể lâu lâu lại run lên, móng nhỏ cùng chiếc đuôi cũng vì thế mà nhúch nhích.\r\n\r\nBốn chiếc móng vuốt nhỏ của ấu tể cuộn tròn lại, bụng nhỏ mềm như bông dán vào lòng bàn tay hắn, Arnold có thể cảm nhận được rõ ràng nhịp tim trong cơ thể bé nhỏ đó, bộ lông mềm mại thỉnh thoảng cọ vào lòng bàn tay hắn, cọ đến đáy lòng hắn phát ngứa.\r\n\r\nThiếu tướng ngày thường gặp chuyện gì cũng không thay đổi sắc mặt, thứ gì cũng chẳng khiến hắn hứng thú vậy là hiện giờ lại đứng một chỗ xấu hổ không dám động sợ sẽ đánh thức tiểu ấu tể trong tay.\r\n\r\nMềm quá....\r\n\r\nArnold im lặng hồi lâu cuối cùng khẽ hạ đầu ngón tay nhẹ nhàng vuốt từ trên lưng ấu tể xuống, bộ lông bù xù lộn xộn vừa chạm vào liền xẹp xuống, còn có phần mượt trước.\r\n\r\nHắn lặp đi lặp lại mấy lần thế là từ một bé ấu tể lông xù liền biến thành bé ấu tể lông mượt.\r\n\r\nSuốt quá trình này ấu tể ngủ trong lòng bàn tay hắn đều như không có bị quấy rầy chút nào, thỉnh thoảng còn ngáy một cách thoải mái.\r\n\r\nTay Arnold lại vòng lại bọc ở phía sau bé chuột, trong đầu hắn cứ không ngừng nhớ tới cảm giác mềm mại khi chạm vào bộ lông kia, đây là lần đầu tiên hắn chạm đến bộ lông mềm mại như vậy, mỗi một sợi đều nhẹ nhàng dán lên đầu ngón tay hắn.\r\n\r\nẤu tể màu vàng kim, trái tim Arnold sắp tan chảy rồi.\r\n\r\nPhía bên kia, các đại lão của viện nghiên cứu khoa học sau khi nhận được tin tức mà nhanh chóng đẩy hết đám nhân viên phòng thí nghiệm vây quanh Keikatsu ra, một đám không biết xấu hổ không màng hình tượng mà chen lên trước dán vào màn hình chỉ vì có thể được nhìn tiểu ấu tể lông xù có một không hai này ở khoảng cách gần nhất.\r\n\r\nNếu không phải có Arnold bảo vệ bé, sẽ không có thể xuất hiện bất cứ nguy hiểm nào thì bọn họ có lẽ đã sớm không chịu được mà tự mình chạy đi đón bé con rồi.\r\n\r\n\"Thật sự có một ấu tể lông xù thế này sao?\" Một vị lão nhân cười xán lạn như một đoá hoa cúc, một bên cách màn hình vuốt ve tiểu ấu tể, biểu cảm đáng khinh như một kẻ biếи ŧɦái, \"Lần đầu tôi thấy, đáng yêu quá.\"\r\n\r\nVài vị nữ sĩ mẫu tính mặt đã giàn dụa nước mắt, ai lại tàn nhẫn đem bé ấu tể đáng yêu như vậy vứt trong cái hộp bẩn thỉu đó chứ, bé con nhất định đã chịu quá nhiều khổ sở mới có thể sợ hãi đến như vậy.\r\n\r\nMỗi ấu tể đều là bảo bối của đế quốc, chờ tiểu ấu tể tới bọn họ nhất định sẽ cẩn thận che chở bé con, để bé con vô lo vô nghĩ mà lớn lên.\r\n\r\nLúc Tống Trường An ngủ lại không biết bản thân chỉ ngủ một giấc thôi mà khi tỉnh lại bỗng dưng có vô số ông ông bà bà.\r\n\r\nSean duy trì liên lạc với viện nghiên cứu khoa học, hâm mộ nhìn tiểu ấu tể trong lòng bàn ray Arnold: \"Nó trông thật mềm, tôi cũng muốn sờ.\"\r\n\r\nCậu ta vừa nói vừa vưon tay qua, trên màn hình một đám lão nhân ánh mắt chờ mong nhìn chằm chằm tay cậu, hận bản thân không phải Sean.\r\n\r\nNgay lúc ngón tay Sean sắp chạm đến tiểu ấu tể, cậu ta đột nhiên cảm giác được có một ánh nhìn gϊếŧ người nhìn cậu, chờ mong cùng háo hức trong lòng đột nhiên tắt ngóm\r\n\r\nArnold lạnh lùng nhìn chằm chằm kẻ đang có âm mưu động tay động chân với tiểu ấu tể của hắn, khoan dung với người cùng phe trước đó một xíu cũng chẳng còn.\r\n\r\nKhoan dung là gì? Ăn được không?\r\n\r\nMột nhóc con không biết tiến lui như thế này cần phải để xã hội mài giũa, nếu không sẽ không biết cái gì nên làm cái gì không.\r\n\r\nSean rụt tay lại: \".....\" Tôi sai rồi, tôi không muốn sờ, một chút cũng không.\r\n\r\n***\r\n\r\nXe bay của Thiếu tướng Arnold dừng trước cổng viện nghiên cứu khoa học, rất nhanh đã thu hút nhiều người qua đường chú ý.\r\n\r\nQuân đội và viện nghiên cứu khoa học ít giao lưu, mọi người không hiểu vì sao hiện tại Thiếu tướng Arnold lại xuất hiện ở đây\r\n\r\nTuy nhiên điều này cũng không có ảnh hướng đến việc càng nhiều người tụ tập gần đó ăn dưa, kể từ buổi trao Quân hàm lần trước Thiếu tướng đã rất lâu không xuất hiện trước công chúng, đối với Thiếu tướng Arnold mới đây tiếp quản Hoài Thạch Tinh với những chiến công lừng lẫy ấy thì mọi người chỉ có một khao khát duy nhất là có thể ở xa xa liếc mắt nhìn ngài ấy một cái là đủ để một đám người trẻ tuổi vui vẻ đến nhảy dựng.\r\n\r\nSau đó, nhiều người phát hiện một đám lão nhân lao ra từ cửa lớn của viện nghiên cứu khoa học, chắn trước cửa xe Thiếu tướng Arnold, nhưng thứ khiến họ kinh ngạc chính là trong đám lão nhân này chỉ cần tùy tiện tra thông tin của một người thì người đó chắc chắn sẽ thường xuất hiện trên Tinh Võng, đều là đại lão trong ngành.\r\n\r\n\"Tình huống gì đây? Tại sao tiến sĩ Keikatsu cũng ra vậy?\"\r\n\r\n\"Có phải tôi đã bỏ lỡ tin tức kinh thiên động địa gì rồi không? Sao lại có nhiều đại lão ra nghênh đón Thiếu tướng Arnold tới vậy?\"\r\n\r\n***\r\n\r\nTrong lúc nhiều người suy luận linh tinh thì lại thấy cửa xe bay mở ra, vị Thiếu tướng bọn họ luôn mong chờ mới vừa xuất hiện đã bị các đại lão chờ đợi từ lâu vây lấy.\r\n\r\nNgay sau đó, ở trong đám người hướng ra ngoài di chuyển một chút, sau khi ra khỏi xe bay, một con báo đen nhánh mặc cơ giáp xuất hiện phía sau họ, đem nhóm người đó giải tán ra, nó vững vàng đáp xuống đất, bàn chân rắn chắc không phát ra bất cứ âm thanh nào, lặng yên không một tiếng động đi theo sau Arnold, thân hình cao lớn của nó chắn toàn bộ ánh nắng chiếu tới người hắn cùng một vài lão già của viện, viện nghiên cứu khoa học như được bao phủ dưới bóng ma.\r\n\r\nNgười tinh mắt nhìn đến một tay của Thiếu tướng Arnold ôm trước mặt, một cái tay khác úp lên che chở đồ vật bên trong, chỉ có một khe hở lộ ra một nhúm lông tơ vàng rất nhỏ.\r\n\r\n\"Ngoạ tào tào tào tào tào tào!! Trong tay Thiếu tướng là cái gì!!?\"\r\n\r\n—————\r\n\r\nTác giả có lời muốn nói:\r\n\r\nTrường An: Trong tay hắn không ai khác chính là tôi đây.\r\n', 3, 13),
(37, 'Tô Noãn', 'Ở thế giới trước, cậu là một cô nhi, không có ai thân thích. Những người bạn ít ỏi đều là những người tự lập, không cần cậu phải bận lòng. Bởi vậy, sống lại ở một thế giới khác dù xa lạ cũng chẳng khiến cậu thấy gánh nặng gì.\r\n\r\nCuốn tiểu thuyết này là bạn cậu đọc cho nghe khi nằm trên giường bệnh vì quá buồn chán. Tuy không phải thể loại yêu thích, nhưng vì bạn cậu có lòng, cậu cũng miễn cưỡng nghe qua. Đáng tiếc, chưa kịp nghe đến kết cục thì cậu đã ra đi. Dẫu vậy, thiết lập và các nhân vật trong câu chuyện, cậu vẫn nhớ được kha khá.\r\n\r\nNhân vật chính là Tô Noãn, vốn là một ca nhi thuộc Hầu phủ ở kinh thành. Vì bị thất lạc từ nhỏ, cậu ta được một gia đình nông dân ở thôn Tô Gia nhận nuôi. Nhưng do mang thân phận ca nhi, lại là con nuôi nên cậu ta không được gia đình đối xử tốt, sống trong khổ cực, thậm chí phải ở trong chuồng lợn.\r\n\r\nSau này, Hầu phủ tìm đến nhận lại Tô Noãn và đưa cậu ta về kinh thành. Từ đó, cậu ta liên tục gặp may, báo thù cho mẹ rồi gả vào phủ của Nguyên soái trấn Bắc, trở thành phu nhân chính thức.\r\n\r\nĐỗ Thanh Thần chỉ nghe đến đoạn Tô Noãn gả vào Nguyên soái phủ với thân phận thứ tử, trở thành Nguyên soái phu nhân. Những tình tiết sau đó cậu không rõ, nhưng có lẽ câu chuyện đã gần đến hồi kết.\r\n\r\nNhững điều này thực ra chẳng liên quan gì đến cậu. Từ khi biết mình đang ở thôn Đỗ Gia, cậu đã chắc chắn rằng mình chỉ là một nhân vật quần chúng, thậm chí không có nổi cái tên trong cuốn sách này.\r\n\r\nCậu biết đây là thế giới trong sách bởi vì thôn Đỗ Gia ở ngay cạnh thôn Tô Gia. Chuyện Hầu phủ tìm con năm xưa đã thành đề tài nóng hổi, khiến mấy thôn quanh vùng bàn tán suốt mấy năm. Trong ký ức của thân xác này cũng có lưu lại chút ít thông tin về sự kiện ấy.\r\n\r\nGia đình Đỗ Thanh Thần và nhà họ Tô nơi nhận nuôi ca nhi của Hầu phủ, thực ra chẳng có quan hệ gì đặc biệt, thậm chí còn không phải cùng thôn. Hai nhà chỉ có thể coi là đồng hương.\r\n\r\nCa nhi mà Hầu phủ nhận nuôi đã được đưa về kinh thành hơn hai năm trước. Theo như nội dung trong sách, từ khi nhân vật chính gả đi, cậu ta chưa từng quay lại. Do vậy, nhân vật chính và Đỗ Thanh Thần gần như không có khả năng gặp gỡ. Đỗ Thanh Thần cũng nghĩ, cứ sống cuộc đời của mình là được rồi.\r\n\r\nCánh tay bó bột, đầu quấn vải trắng, Đỗ Thanh Thần chậm rãi bước đến ngồi dưới gốc cây trước cửa nhà. Đã mấy ngày trôi qua kể từ khi cậu đến thế giới này, vết thương trên người đã đỡ hơn, cậu cũng bắt đầu đi lại được, nhưng người trong nhà vẫn lo lắng, không cho cậu đi xa.\r\n', 2, 12),
(38, ' Phụ thân lại đến tiệm cơm phải không?!', 'Thân thể này trước đây bị người ta đánh đến chết. Đỗ Thanh Thần đoán nguyên nhân tử vong là cú đập mạnh vào đầu. Nhân cơ hội đó, cậu giải thích rằng mình bị mất trí nhớ, nhiều chuyện đã quên sạch, và điều này không hề sai, cậu thực sự chỉ có được một phần ký ức của thân thể này.\r\n\r\nNhờ lý do đó, phụ thân và đệ đệ nhà họ Đỗ không hỏi thêm gì về việc tại sao lúc đầu cậu không nhận ra họ. \"Chắc là đầu óc bị thương, nên phải dưỡng thật tốt, lỡ một ngày nào đó lại quên mất phụ thân và đệ đệ thì làm sao đây?\"\r\n\r\n“Ca, sao lại ra ngoài nữa? Mau quay vào nghỉ đi! Đại phu đã dặn là đầu của huynh phải được chăm sóc cẩn thận.” Đỗ Như Lâm chỉ vừa rời mắt một lát đã thấy Đỗ Thanh Thần bước ra ngoài, bèn lập tức chạy tới.\r\n\r\nĐỗ Thanh Thần mỉm cười: “Ta không sao, ngoài chút đau đầu, mọi thứ đều ổn cả.”\r\n\r\n“Ổn gì mà ổn!” Đỗ Như Lâm vẫn còn sợ hãi khi nhớ lại: “Huynh không biết lúc đó đã mất bao nhiêu máu đâu! Đại phu còn nói, mạng sống của huynh khi ấy chỉ có thể dựa vào ý trời. May mà huynh tỉnh lại, nếu không...” Vừa nói, nước mắt cậu bé lại rưng rưng.\r\n\r\nSo với lần đầu gặp, hôm nay Đỗ Như Lâm sạch sẽ hơn nhiều, không còn là cậu bé lấm lem bùn đất. Khuôn mặt trắng trẻo, thanh tú của cậu trở nên vô cùng đáng yêu, chỉ có điều trên mu bàn tay vẫn dính một vệt mực, khiến khuôn mặt cậu như bị tô thêm một \"bông hoa lớn\".\r\n\r\nĐỗ Thanh Thần mỉm cười, trong ký ức của thân thể này, đệ đệ của cậu học hành rất giỏi, hiện đang học ở tư thục trong thị trấn. Chắc hẳn vệt mực đó là do vừa luyện chữ xong.\r\n\r\nNhà họ Đỗ tuy không thuộc hàng khá giả, nhưng vẫn có một tiệm cơm nhỏ ở thị trấn làm nguồn thu nhập. Chính nhờ có tiệm cơm mà hai huynh đệ nhà họ Đỗ đều được đi học. Chỉ là Đỗ Thanh Thần không có năng khiếu học hành, nên khi trưởng thành đã về tiệm cơm phụ giúp. Ngược lại, Đỗ Như Lâm học rất giỏi, nên cả gia đình dốc toàn lực chu cấp cho cậu đi học. Vì vậy, dù không quá nghèo túng, nhà họ Đỗ cũng chẳng dư dả gì, cả nhà chỉ có thể sống trong căn nhà đất tồi tàn, ngày ngày ăn cơm độn rau.\r\n\r\nĐỗ Thanh Thần bước chậm rãi đến bên Đỗ Như Lâm, nhẹ nhàng lau vệt mực trên mặt cậu. Đỗ Như Lâm ngẩn ra, sau đó đỏ bừng mặt, cúi đầu xấu hổ.\r\n\r\n“Phụ thân đâu rồi?” Đỗ Thanh Thần hỏi.\r\n\r\n“Phụ thân… ông ấy...” Đỗ Như Lâm ngập ngừng, nhớ đến lời dặn của phụ thân trước khi đi không được nói với ca ca rằng ông đi đâu, sợ cậu lo lắng liền lắp bắp không đáp.\r\n\r\nNhưng cậu tuổi còn nhỏ, không giỏi nói dối. Một chút chần chừ đó đã bị Đỗ Thanh Thần nhận ra. Cậu giả bộ tức giận, truy hỏi: “Phụ thân lại đến tiệm cơm phải không?!”\r\n\r\n“Không… không phải…” Đỗ Như Lâm lúng túng vẫy tay phủ nhận.', 3, 12),
(39, 'Tiệm cơm nhỏ ', 'Bộ dạng của cậu bé đã tố cáo hết mọi chuyện. Đỗ Thanh Thần lập tức nhíu mày, trách mắng: “Đệ không biết là bây giờ không được đến tiệm cơm sao?! Đệ nhìn xem đầu ta ra nông nỗi này, nếu phụ thân xảy ra chuyện nữa thì phải làm thế nào?!”\r\n\r\nTrong ký ức, nguyên chủ là lao động chính của tiệm cơm. Phụ thân cậu đã có tuổi, chỉ phụ giúp rửa bát đĩa. Thậm chí, mọi người trong thị trấn khi nhắc đến tiệm cơm đều gọi cậu là chủ quán, chứ không phải phụ thân cậu. Việc cậu bị thương cũng chính vì tiệm cơm này mà ra.\r\n\r\nTiệm cơm nhỏ là gia sản tổ truyền của nhà họ Đỗ. Dù quy mô không lớn, nhưng nhờ vị trí thuận lợi, nó trở thành mục tiêu của Trần lão gia, một phú hộ lớn nhất thị trấn. Trần lão gia muốn mua lại tiệm cơm, nhưng nhà họ Đỗ không đồng ý. Không chỉ vì đây là tổ nghiệp, mà tiệm cơm còn là nguồn sống duy nhất của gia đình. Nếu mất đi tiệm cơm, tiền đâu cho Đỗ Như Lâm tiếp tục học hành?\r\n\r\nVì thế, Trần lão gia liền thuê bọn côn đồ tới quấy rối, khiến gia đình họ Đỗ luôn phải căng mình chống đỡ. Đỉnh điểm là lần trước, khi bọn côn đồ tới ăn, vu khống rằng đồ ăn của quán không sạch, làm họ đau bụng. Trong lúc tranh cãi, một tên đã vung ghế đập trúng đầu Đỗ Thanh Thần. Chính cú đập này đã khiến nguyên chủ tử vong rồi để cậu xuyên không đến đây.\r\n\r\nTiệm cơm sớm đã không thể duy trì được nữa, vậy mà phụ thân vẫn dám đến đó.\r\n\r\nĐỗ Thanh Thần hiểu sự lo lắng của phụ thân dành cho tiệm cơm, nhưng cậu không thể chấp nhận việc ông coi nhẹ mạng sống của mình.\r\n\r\n“Ta phải đến tiệm cơm!” Đỗ Thanh Thần trầm giọng nói.\r\n\r\n“Không được đâu! Phụ thân bảo huynh phải ở nhà dưỡng thương. Ông ấy chỉ đi xem có ai trộm cắp gì không rồi sẽ về ngay.”\r\n\r\n“Nếu vậy thì ta cũng chỉ đi xem, tiện đón phụ thân về luôn.”\r\n\r\nCậu biết phụ thân yếu ớt lại đang mang bệnh, nếu gặp bọn côn đồ kia thì chỉ cần bị đẩy một cái cũng có thể ngã quỵ. Nhưng cậu thì khác, lần trước bọn chúng đã sợ đến vứt ghế bỏ chạy khi thấy cậu chảy nhiều máu, vì chúng e sợ việc gϊếŧ người.\r\n\r\nKhông thể ngăn cản ca ca, Đỗ Như Lâm đành lẽo đẽo theo sau. Dù cậu muốn đi một mình nhưng Đỗ Thanh Thần cũng không nỡ từ chối, đành để đệ đi cùng.\r\n\r\nDọc theo con đường làng dẫn ra thị trấn, quãng đường thực ra không xa lắm. Đỗ Thanh Thần cảm thấy cơ thể mình vẫn ổn, vết thương trên đầu không có dấu hiệu gì bất thường.\r\n', 4, 12),
(40, 'ch1', 'aaa', 1, 15),
(42, 'ch3', 'cccc', 2, 15),
(43, 'ch4', 'dddd', 3, 15),
(46, 'CHƯƠNG 1', 'chương 1 đang cập nhật', 1, 17),
(47, 'CHƯƠNG 2', 'Chương 2 đang cập nhật nhé', 2, 17),
(48, 'Chương 3', 'Chương 3 vẫn đang được cập nhật', 3, 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_thongtinnguoidung`
--

CREATE TABLE `book_thongtinnguoidung` (
  `id` bigint NOT NULL,
  `ten_hien_thi` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `anh_dai_dien` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gioi_tinh` smallint NOT NULL,
  `role` int NOT NULL,
  `last_role` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_thongtinnguoidung`
--

INSERT INTO `book_thongtinnguoidung` (`id`, `ten_hien_thi`, `anh_dai_dien`, `gioi_tinh`, `role`, `last_role`, `user_id`) VALUES
(1, 'Dung', 'uploads/avatars/Screenshot_2025-03-28_131723_05taYcN.png', 1, 0, 0, 2),
(2, 'Admin', 'uploads/avatars/image_0.jpg', 1, 2, 2, 1),
(3, 'Nguyễn Văn A', 'uploads/avatars/hinh-cute-meo-12-13-59-56_ew00r2e.jpg', 1, 0, 0, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_truyen`
--

CREATE TABLE `book_truyen` (
  `id` bigint NOT NULL,
  `ten_truyen` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `so_luong_chuong` int UNSIGNED NOT NULL,
  `tom_tat_noi_dung` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `anh_dai_dien` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `luot_xem` int UNSIGNED NOT NULL,
  `luot_thich` int UNSIGNED NOT NULL,
  `ngay_cap_nhat` datetime(6) NOT NULL,
  `trang_thai` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `khoa` tinyint(1) NOT NULL,
  `id_tac_gia_id` bigint NOT NULL
) ;

--
-- Đang đổ dữ liệu cho bảng `book_truyen`
--

INSERT INTO `book_truyen` (`id`, `ten_truyen`, `so_luong_chuong`, `tom_tat_noi_dung`, `anh_dai_dien`, `luot_xem`, `luot_thich`, `ngay_cap_nhat`, `trang_thai`, `khoa`, `id_tac_gia_id`) VALUES
(1, 'Cuộc phiêu lưu của MyMy', 2, 'Câu truyện vô cùng thú vị và hấp dẫn', 'uploads/truyen/hinh-cute-meo-12-13-59-56.jpg', 1, 0, '2025-02-27 00:20:59.471588', 'dang_ra', 0, 1),
(2, 'Xuân Phong Mục Noãn', 2, 'Câu truyện về cô gái trẻ mộng mơ , yêu đời , yêu người', 'uploads/truyen/z6330909958579_866552c51d78fa890b3ad9706f086c20.jpg', 0, 0, '2025-02-27 00:26:31.245805', 'dang_ra', 0, 1),
(4, 'Thiên Tài Nhìn Thấu Thế Giới', 2, 'Thiên tài là người có năng lực hơn người', 'uploads/truyen/z6330909984390_7ab8ad913156a5c2efb9ed6d27ba279d.jpg', 0, 0, '2025-02-27 02:48:36.901524', 'dang_ra', 0, 1),
(5, 'Tuyệt Thế Đan Thần', 2, 'Ngạo Thế Đan Thần (Tuyệt Thế Thần Đan) Giới thiệu: Thiếu niên Thẩm Tường khi đi leo núi hái thuốc vô tình ngã xuống vực sâu may mắn gặp được Thần nữ và Ma nữ, đạt được truyền…', 'uploads/truyen/Audio-Ngao-The-Dan-Than-dich.jpg', 1, 0, '2025-02-27 03:08:06.003633', 'dang_ra', 0, 1),
(6, 'Huyền Lục', 5, 'Một câu chuyện tu chân đan xen giữa sinh hoạt đời sống của phàm nhân “Huyền Lục” Tự cổ vạn năm, Huyền Lục chiếu viết Huyền Đô Đại Lục tu chân giới thịnh hành, người người tu luyện', 'uploads/truyen/Huyen-Luc-Audio-Truyen.jpg', 2, 0, '2025-03-01 23:45:38.172288', 'dang_ra', 0, 1),
(7, 'Kết Hôn  Ông Chồng Thực Vật', 5, 'Đây chỉ là một phần nhỏ trong hành trình của KẾT HÔN VỚI ÔNG CHỒNG THỰC VẬT – câu chuyện còn ẩn chứa nhiều bất ngờ và kịch tính hơn nữa, chắc chắn sẽ khiến bạn không thể rời mắt.', 'uploads/truyen/Screenshot_2025-02-27_150227.png', 2, 0, '2025-05-07 07:01:07.944042', 'dang_ra', 0, 1),
(11, 'Tiểu Nha Hoàn Vượt Ngàn Dặm Chôn Lang Quân', 4, 'Người ta nói ta là kẻ si dại—  \r\n\r\nLúc lang quân lận đận, ta chẳng rời chẳng bỏ.  \r\n\r\nĐến khi lang quân quyền cao chức trọng, ta lại nhất quyết rời đi.  \r\n\r\nNghe vậy, ta chỉ khẽ cười.  \r\n\r\nLang quân báo đáp ta—là vì ta đã ở bên hắn khi hắn còn thấp kém.  \r\n\r\nNhưng ta nào phải hạng người dựa vào ân tình để cầu báo đáp?  \r\n\r\nTa thu dọn hành lý, chuẩn bị về quê.  \r\n\r\nNào ngờ, hắn lại chặn ta vào góc tường, mắt đỏ hoe, giọng khàn khàn hỏi:  \r\n\r\n\"Nàng thực sự… chưa từng có chút tình ý nào với ta sao?\"', 'uploads/truyen/1740356306-tieu-nha-hoan-vuot-ngan-dam-chon-lang-quan_EGat7bs.jpg', 13, 0, '2025-05-07 07:01:21.959029', 'dang_ra', 0, 1),
(12, 'Trọng Sinh Làm Dân Quê Mở Tiệm Cơm Nhỏ', 4, 'Đỗ Thanh Thần bất ngờ xuyên vào thế giới trong một cuốn tiểu thuyết, trở thành một nhân vật quần chúng vô danh không ai nhớ mặt.\r\nPhụ thân ốm yếu, đệ đệ còn nhỏ, trong nhà nghèo rớt mồng tơi, đến cả bốn bức tường cũng chỉ toàn gió lùa. Cứ tưởng bi kịch đến thế là hết, nào ngờ gia đình còn sắp đặt cho cậu một mối hôn sự.\r\nHả? Đây chẳng phải là đệ đệ pháo hôi của nhân vật chính hay sao? Cuối cùng gả nhầm người, bị hành hạ đến chết thảm thiết đó ư…\r\nNhìn gương mặt đỏ bừng như quả đào, ánh mắt ngấn lệ, e thẹn đáng yêu như một chú thỏ nhỏ của tiểu phu lang, trái tim Đỗ Thanh Thần mềm nhũn thành một vũng nước.\r\nPháo hôi gì chứ! Ai dám động đến cậu ấy, cậu liều mạng với kẻ đó! Từ hôm nay, người này, do Đỗ Thanh Thần cậu bảo vệ!\r\nThế là, cậu chăm sóc phu lang, mở quán ăn, làm giàu đổi đời, còn dẫn theo tiểu pháo hôi bước lêи đỉиɦ cao cuộc đời.\r\n[Chủ công, truyện mỹ thực điền văn, ấm áp không có nhân vật phản diện, thế giới quan nam nữ ca nhi, sinh tử văn, đầu truyện điền viên, cuối truyện có chút dính líu đến triều đình.]', 'uploads/truyen/trong-sinh-lam-dan-que-mo-tiem-com-nho-1735410880.jpg', 4, 0, '2025-05-14 09:34:40.171535', 'dang_ra', 0, 1),
(13, 'Con Hamster Lông Vàng Cuối Cùng Của Vũ Trụ', 3, 'Tống Trường An tử vong vì gặp tai nạn giao thông, sau đó phát hiện bản thân lại còn sống, có điều lại trở thành một bé hamster mà em họ mình đang nuôi…\r\n\r\nNhưng mà tại sao lại không phải ở nhà của em họ? Mà xuất hiện trên xe của một người lạ???\r\n\r\nTống Trường An nghĩ mãi không ra, cho đến khi chủ nhân chiếc xe xuất hiện, nhìn thấy một cái l*иg đột nhiên ở trong xe mình, nghi ngờ là chiêu trò của đối thủ, là một cái bẫy khiến hắn mất mạng…\r\n\r\nTống Trường An nghe được tất cả, ngày càng hoảng hốt, không thể nhịn nữa đành kêu lên\r\n\r\n\"Hay là anh nuôi tôi hai ngày, chờ tôi khoẻ lại tôi sẽ đi liền!!\"\r\n\r\n***\r\n\r\nVì sinh tồn và sinh sản, toàn vũ trụ đều bắt đầu tiến hoá thành mình đồng da sắt, bộ lông mềm mại dần trở thành giấc mộng xa xôi không thể với tới của mỗi người.\r\n\r\nMãi đến một ngày, thiết huyết thiếu tướng cuat đế quốc nhặt được một nhóc con lông xù ở trên xe, náo loạn cả Tinh Võng.\r\n\r\n\"A a a a mấy người nhìn kìa, đôi mắt nhỏ, chiếc mũi nhỏ, móng vuốt nhỏ, muốn sờ!!\"\r\n\r\n\"Thật muốn chọt mông nhỏ của nó một cái, nhất định sẽ cực mềm!!\"\r\n\r\n\"Ơ, sao lại không thấy nữa?\"\r\n\r\nThiếu tướng mặt không cảm xúc xuất hiện trên màn hình: \"Tôi nhặt được, tôi nuôi, của tôi.\"', 'uploads/truyen/con-hamster-long-vang-cuoi-cung-cua-vu-tru.jpg', 0, 0, '2025-05-14 09:33:30.318138', 'dang_ra', 0, 1),
(14, 'Xuyên Thành Con Gái Của Nữ Chính Trong Truyện Ngược', 3, 'Mẹ tôi là nữ chính ngốc nghếch của tiểu thuyết ngược tâm,\r\n\r\nMẹ tôi là thế thân mang thai bỏ trốn trong truyện bá tổng,\r\n\r\nCòn tôi, tại hạ bất tài, chỉ là thiên tài hacker năm tuổi.\r\n\r\n——\r\nThiên tài hacker Cố Sơ trọng sinh vào một cuốn tiểu thuyết ngược tâm.\r\n\r\nCô biến thành một bé con năm tuổi, mẹ cô là nữ chính số khổ trong truyện, cha cô là tổng tài mù quáng, xung quanh còn có cả một đám họ hàng rình rập, dì Bạch Liên Hoa chuyên giả tạo, đủ kiểu nữ phản diện tự tìm đường chết…\r\n\r\nCố Sơ vươn thẳng thân hình bé nhỏ, bắt đầu giúp mẹ đấu trí đấu dũng.\r\n\r\nTrẻ con năm tuổi thì có thể có ý xấu gì chứ?\r\n\r\nChỉ là muốn bảo vệ mẹ mà thôi,\r\n\r\nNhân tiện tiếp quản tài sản khổng lồ của cha tổng tài.\r\n\r\n...\r\n\r\nCho đến một ngày,\r\n\r\nNgười đàn ông từng truy sát cô suốt nửa vòng trái đất kiếp trước xuất hiện.\r\n\r\nNhìn cô bé con mặc váy công chúa đang khóc nức nở trước mặt, người đàn ông chìm vào im lặng thật lâu.\r\n\r\nLưu ý:\r\nBan đầu sẽ theo sát cốt truyện gốc, sau đó mở ra con đường phát triển hoàn toàn mới!', 'uploads/truyen/xuyen-thanh-con-gai-cua-nu-chinh-trong-truyen-nguoc-1744535591.jpg', 1, 0, '2025-05-15 11:04:27.339521', 'dang_ra', 0, 1),
(15, 'doan22', 3, 'aaaaa', 'uploads/truyen/sau-khi-bi-nghe-thay-tieng-long-ta-buong-xuoi-nam-khong-lai-thang-1744615937.jpg', 1, 0, '2025-05-15 11:48:47.432954', 'hoan_thanh', 0, 1),
(17, 'doan3', 3, 'hay nha ', 'uploads/truyen/13440633_wk03lNd.jpg', 2, 0, '2025-06-07 07:10:52.185364', 'dang_ra', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book_truyenyeuthich`
--

CREATE TABLE `book_truyenyeuthich` (
  `id` bigint NOT NULL,
  `id_nguoi_dung_id` bigint NOT NULL,
  `id_truyen_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `book_truyenyeuthich`
--

INSERT INTO `book_truyenyeuthich` (`id`, `id_nguoi_dung_id`, `id_truyen_id`) VALUES
(4, 1, 11),
(5, 1, 15),
(6, 1, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-02-08 23:44:25.448258', '2', 'reader1', 1, '[{\"added\": {}}]', 4, 1),
(2, '2025-02-08 23:46:14.109674', '2', 'reader1', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(3, '2025-02-09 00:02:29.221701', '1', '1 - Dung', 1, '[{\"added\": {}}]', 10, 1),
(4, '2025-02-20 23:34:01.837135', '2', 'H', 3, '', 7, 1),
(5, '2025-02-27 00:18:26.755068', '2', '2 - Admin', 1, '[{\"added\": {}}]', 10, 1),
(6, '2025-02-27 00:18:45.778739', '1', 'Admin', 1, '[{\"added\": {}}]', 11, 1),
(7, '2025-02-27 22:55:35.435697', '1', 'Cuộc phiêu lưu của MyMy - Hài hước', 1, '[{\"added\": {}}]', 17, 1),
(8, '2025-02-27 22:56:32.343812', '2', 'Xuân Phong Mục Noãn - Ngôn tình', 1, '[{\"added\": {}}]', 17, 1),
(9, '2025-02-27 22:56:46.568154', '3', 'Quy Tắc Sinh Tồn Của Công Chúa - Truyền kỳ', 1, '[{\"added\": {}}]', 17, 1),
(10, '2025-02-27 22:56:53.658377', '4', 'Thiên Tài Nhìn Thấu Thế Giới - Trinh thám', 1, '[{\"added\": {}}]', 17, 1),
(11, '2025-02-27 22:57:08.386331', '5', 'Tuyệt Thế Đan Thần - Kinh dị', 1, '[{\"added\": {}}]', 17, 1),
(12, '2025-02-27 22:57:27.676481', '6', 'Huyền Lục - Thể dục thể thao', 1, '[{\"added\": {}}]', 17, 1),
(13, '2025-03-26 08:14:46.613748', '1', '1 - Dung', 2, '[]', 10, 1),
(14, '2025-03-26 08:23:44.176734', '1', '1 - Dung', 2, '[]', 10, 1),
(15, '2025-03-26 08:54:32.356931', '1', '1 - Dung', 2, '[{\"changed\": {\"fields\": [\"Anh dai dien\"]}}]', 10, 1),
(16, '2025-05-07 06:47:01.670167', '11', 'Tiểu Nha Hoàn Vượt Ngàn Dặm Chôn Lang Quân', 2, '[{\"changed\": {\"fields\": [\"So luong chuong\", \"Tom tat noi dung\"]}}]', 12, 1),
(17, '2025-05-14 09:48:55.938785', '14', 'Luotxem object (14)', 3, '', 18, 1),
(18, '2025-05-14 09:48:55.938841', '13', 'Luotxem object (13)', 3, '', 18, 1),
(19, '2025-05-14 09:48:55.938872', '12', 'Luotxem object (12)', 3, '', 18, 1),
(20, '2025-05-24 03:35:41.957379', '5', 'reader2 đánh giá Tiểu Nha Hoàn Vượt Ngàn Dặm Chôn Lang Quân - 0 sao', 3, '', 19, 1),
(21, '2025-05-24 03:35:41.957488', '4', 'reader1 đánh giá Tiểu Nha Hoàn Vượt Ngàn Dặm Chôn Lang Quân - 0 sao', 3, '', 19, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(15, 'book', 'chuongdadoc'),
(19, 'book', 'danhgiatruyen'),
(8, 'book', 'feedback'),
(18, 'book', 'luotxem'),
(9, 'book', 'passwordreset'),
(11, 'book', 'tacgia'),
(7, 'book', 'theloai'),
(17, 'book', 'theloaitruyen'),
(16, 'book', 'thichtruyen'),
(13, 'book', 'thongtinchuongtruyen'),
(10, 'book', 'thongtinnguoidung'),
(12, 'book', 'truyen'),
(14, 'book', 'truyenyeuthich'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-02-08 23:20:52.053390'),
(2, 'auth', '0001_initial', '2025-02-08 23:20:53.097771'),
(3, 'admin', '0001_initial', '2025-02-08 23:20:53.310392'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-02-08 23:20:53.317346'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-08 23:20:53.330057'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-02-08 23:20:53.444177'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-02-08 23:20:53.550716'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-02-08 23:20:53.589273'),
(9, 'auth', '0004_alter_user_username_opts', '2025-02-08 23:20:53.596413'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-02-08 23:20:53.675968'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-02-08 23:20:53.680068'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-02-08 23:20:53.688186'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-02-08 23:20:53.818040'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-02-08 23:20:53.933508'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-02-08 23:20:53.971351'),
(16, 'auth', '0011_update_proxy_permissions', '2025-02-08 23:20:53.982713'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-02-08 23:20:54.103444'),
(18, 'book', '0001_initial', '2025-02-08 23:20:56.684777'),
(19, 'sessions', '0001_initial', '2025-02-08 23:20:56.742475'),
(20, 'book', '0002_danhgiatruyen_parent', '2025-05-24 02:00:31.950126'),
(21, 'book', '0003_alter_danhgiatruyen_options_and_more', '2025-05-24 02:08:42.588600');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('30ty2y9x51kjn73w25hnywtvtsnr6jvf', '.eJxVjMEOwiAQRP-FsyEuFASP3vsNBHYXqRpISnsy_rtt0oPeJvPezFuEuC4lrJ3nMJG4ChCn3y5FfHLdAT1ivTeJrS7zlOSuyIN2OTbi1-1w_w5K7GVbo086kzEONDiD0XG6eOfylo1VSSENjJqSsmfWkSwowx4Q_KAxWyDx-QLq7zgM:1uYhR4:tY6YZZa5Gt2upKDojwSmZfPgmLzhDhwRyv0Ws9sd-zU', '2025-07-21 08:42:50.667268'),
('fr9ho6ceyospuomgoe41c6h0zdswlgdv', '.eJxVjEEOwiAQRe_C2hAKtIBL956BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4kzgLLU6_WwJ8cN0B3aHemsRW12VOclfkQbu8NuLn5XD_Dgr08q2z9eysD9pTNgbYW1DIUwKnUOtRG28zYsqarDLgOQ_KTWBGDCnQQEG8P-yhODg:1ufsb2:Ux0_jNhtU44cmYII1IBs7c45aT69SEcZzi-bpuZxy-I', '2025-08-10 04:02:48.099928'),
('ootgudcox50lakjr8e2b7loogg1ji8u8', '.eJxVjEEOwiAQRe_C2hAKtIBL956BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4kzgLLU6_WwJ8cN0B3aHemsRW12VOclfkQbu8NuLn5XD_Dgr08q2z9eysD9pTNgbYW1DIUwKnUOtRG28zYsqarDLgOQ_KTWBGDCnQQEG8P-yhODg:1uN4JL:U0ThJXm8vZbEt4gcB5cWSUg5sJmnDP_qma4kgt1KtoQ', '2025-06-19 06:42:47.510142'),
('rri1voio9fjkmt2m6eefpzirtge6t7xc', '.eJxVjEEOwiAQRe_C2hAKtIBL956BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4kzgLLU6_WwJ8cN0B3aHemsRW12VOclfkQbu8NuLn5XD_Dgr08q2z9eysD9pTNgbYW1DIUwKnUOtRG28zYsqarDLgOQ_KTWBGDCnQQEG8P-yhODg:1uNnsO:soG9UVtfwSPKoCqI4RBCOvxtsm-CBez32Ygn19_2Czw', '2025-06-21 07:22:00.490240'),
('xiqqiv1kehegcpmae2ks3egm4twu0hh5', '.eJxVjMEOwiAQRP-FsyEuFASP3vsNBHYXqRpISnsy_rtt0oPeJvPezFuEuC4lrJ3nMJG4ChCn3y5FfHLdAT1ivTeJrS7zlOSuyIN2OTbi1-1w_w5K7GVbo086kzEONDiD0XG6eOfylo1VSSENjJqSsmfWkSwowx4Q_KAxWyDx-QLq7zgM:1trL8Z:0WrpsVaSQQXK2HMYNW7pbdmNpVv7C963cSKP9rA9yTU', '2025-03-23 18:12:31.539651'),
('ywzwfjl3a1jz771r5w3woacw8c4y8eof', '.eJxVjEEOwiAQRe_C2hAKtIBL956BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4kzgLLU6_WwJ8cN0B3aHemsRW12VOclfkQbu8NuLn5XD_Dgr08q2z9eysD9pTNgbYW1DIUwKnUOtRG28zYsqarDLgOQ_KTWBGDCnQQEG8P-yhODg:1uNpTm:V_XPhXeID4KJAEZtckTwskY2FmVzd5LcYjAk5lXKlD0', '2025-06-21 09:04:42.504842');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `book_chuongdadoc`
--
ALTER TABLE `book_chuongdadoc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_chuong_dadoc` (`user_id`,`chuong_id`),
  ADD KEY `book_chuongdadoc_chuong_id_96c21641_fk_book_thon` (`chuong_id`);

--
-- Chỉ mục cho bảng `book_danhgiatruyen`
--
ALTER TABLE `book_danhgiatruyen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_danhgiatruyen_id_truyen_id_380f79b8_fk_book_truyen_id` (`id_truyen_id`),
  ADD KEY `book_danhgiatruyen_parent_id_e7fe638f_fk_book_danhgiatruyen_id` (`parent_id`),
  ADD KEY `book_danhgiatruyen_user_id_0f1d58ad` (`user_id`);

--
-- Chỉ mục cho bảng `book_feedback`
--
ALTER TABLE `book_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_feedback_user_id_a434cd28_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `book_luotxem`
--
ALTER TABLE `book_luotxem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_luotxem_user_id_4c79b1f3_fk_auth_user_id` (`user_id`),
  ADD KEY `book_luotxe_id_truy_71d43c_idx` (`id_truyen_id`,`ip_address`,`thoigian_xem`);

--
-- Chỉ mục cho bảng `book_passwordreset`
--
ALTER TABLE `book_passwordreset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reset_id` (`reset_id`),
  ADD KEY `book_passwordreset_user_id_d6300b58_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `book_tacgia`
--
ALTER TABLE `book_tacgia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_nguoi_dung_id` (`id_nguoi_dung_id`);

--
-- Chỉ mục cho bảng `book_theloai`
--
ALTER TABLE `book_theloai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ten_the_loai` (`ten_the_loai`);

--
-- Chỉ mục cho bảng `book_theloaitruyen`
--
ALTER TABLE `book_theloaitruyen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_truyen_theloai` (`id_truyen_id`,`id_the_loai_id`),
  ADD KEY `book_theloaitruyen_id_the_loai_id_b6a8fdd0_fk_book_theloai_id` (`id_the_loai_id`);

--
-- Chỉ mục cho bảng `book_thichtruyen`
--
ALTER TABLE `book_thichtruyen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_thich_truyen` (`user_id`,`id_truyen_id`),
  ADD KEY `book_thichtruyen_id_truyen_id_2f79948c_fk_book_truyen_id` (`id_truyen_id`);

--
-- Chỉ mục cho bảng `book_thongtinchuongtruyen`
--
ALTER TABLE `book_thongtinchuongtruyen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_thongtinchuongt_id_truyen_id_952711eb_fk_book_truy` (`id_truyen_id`);

--
-- Chỉ mục cho bảng `book_thongtinnguoidung`
--
ALTER TABLE `book_thongtinnguoidung`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `book_truyen`
--
ALTER TABLE `book_truyen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ten_truyen` (`ten_truyen`),
  ADD KEY `book_truyen_id_tac_gia_id_b6a8ea6f_fk_book_tacgia_id` (`id_tac_gia_id`);

--
-- Chỉ mục cho bảng `book_truyenyeuthich`
--
ALTER TABLE `book_truyenyeuthich`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_truyenyeuthich_id_nguoi_dung_id_12aa27b7_fk_book_thon` (`id_nguoi_dung_id`),
  ADD KEY `book_truyenyeuthich_id_truyen_id_0445e9a3_fk_book_truyen_id` (`id_truyen_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `book_chuongdadoc`
--
ALTER TABLE `book_chuongdadoc`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `book_danhgiatruyen`
--
ALTER TABLE `book_danhgiatruyen`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `book_feedback`
--
ALTER TABLE `book_feedback`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `book_luotxem`
--
ALTER TABLE `book_luotxem`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `book_passwordreset`
--
ALTER TABLE `book_passwordreset`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `book_tacgia`
--
ALTER TABLE `book_tacgia`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `book_theloai`
--
ALTER TABLE `book_theloai`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `book_theloaitruyen`
--
ALTER TABLE `book_theloaitruyen`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT cho bảng `book_thichtruyen`
--
ALTER TABLE `book_thichtruyen`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `book_thongtinchuongtruyen`
--
ALTER TABLE `book_thongtinchuongtruyen`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `book_thongtinnguoidung`
--
ALTER TABLE `book_thongtinnguoidung`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `book_truyen`
--
ALTER TABLE `book_truyen`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `book_truyenyeuthich`
--
ALTER TABLE `book_truyenyeuthich`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `book_chuongdadoc`
--
ALTER TABLE `book_chuongdadoc`
  ADD CONSTRAINT `book_chuongdadoc_chuong_id_96c21641_fk_book_thon` FOREIGN KEY (`chuong_id`) REFERENCES `book_thongtinchuongtruyen` (`id`),
  ADD CONSTRAINT `book_chuongdadoc_user_id_1e887cbe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `book_danhgiatruyen`
--
ALTER TABLE `book_danhgiatruyen`
  ADD CONSTRAINT `book_danhgiatruyen_id_truyen_id_380f79b8_fk_book_truyen_id` FOREIGN KEY (`id_truyen_id`) REFERENCES `book_truyen` (`id`),
  ADD CONSTRAINT `book_danhgiatruyen_parent_id_e7fe638f_fk_book_danhgiatruyen_id` FOREIGN KEY (`parent_id`) REFERENCES `book_danhgiatruyen` (`id`),
  ADD CONSTRAINT `book_danhgiatruyen_user_id_0f1d58ad_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `book_feedback`
--
ALTER TABLE `book_feedback`
  ADD CONSTRAINT `book_feedback_user_id_a434cd28_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `book_luotxem`
--
ALTER TABLE `book_luotxem`
  ADD CONSTRAINT `book_luotxem_id_truyen_id_4ab848aa_fk_book_truyen_id` FOREIGN KEY (`id_truyen_id`) REFERENCES `book_truyen` (`id`),
  ADD CONSTRAINT `book_luotxem_user_id_4c79b1f3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `book_passwordreset`
--
ALTER TABLE `book_passwordreset`
  ADD CONSTRAINT `book_passwordreset_user_id_d6300b58_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `book_tacgia`
--
ALTER TABLE `book_tacgia`
  ADD CONSTRAINT `book_tacgia_id_nguoi_dung_id_6d93f713_fk_book_thon` FOREIGN KEY (`id_nguoi_dung_id`) REFERENCES `book_thongtinnguoidung` (`id`);

--
-- Các ràng buộc cho bảng `book_theloaitruyen`
--
ALTER TABLE `book_theloaitruyen`
  ADD CONSTRAINT `book_theloaitruyen_id_the_loai_id_b6a8fdd0_fk_book_theloai_id` FOREIGN KEY (`id_the_loai_id`) REFERENCES `book_theloai` (`id`),
  ADD CONSTRAINT `book_theloaitruyen_id_truyen_id_4d2bdfbd_fk_book_truyen_id` FOREIGN KEY (`id_truyen_id`) REFERENCES `book_truyen` (`id`);

--
-- Các ràng buộc cho bảng `book_thichtruyen`
--
ALTER TABLE `book_thichtruyen`
  ADD CONSTRAINT `book_thichtruyen_id_truyen_id_2f79948c_fk_book_truyen_id` FOREIGN KEY (`id_truyen_id`) REFERENCES `book_truyen` (`id`),
  ADD CONSTRAINT `book_thichtruyen_user_id_58a03a05_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `book_thongtinchuongtruyen`
--
ALTER TABLE `book_thongtinchuongtruyen`
  ADD CONSTRAINT `book_thongtinchuongt_id_truyen_id_952711eb_fk_book_truy` FOREIGN KEY (`id_truyen_id`) REFERENCES `book_truyen` (`id`);

--
-- Các ràng buộc cho bảng `book_thongtinnguoidung`
--
ALTER TABLE `book_thongtinnguoidung`
  ADD CONSTRAINT `book_thongtinnguoidung_user_id_d687c27c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `book_truyen`
--
ALTER TABLE `book_truyen`
  ADD CONSTRAINT `book_truyen_id_tac_gia_id_b6a8ea6f_fk_book_tacgia_id` FOREIGN KEY (`id_tac_gia_id`) REFERENCES `book_tacgia` (`id`);

--
-- Các ràng buộc cho bảng `book_truyenyeuthich`
--
ALTER TABLE `book_truyenyeuthich`
  ADD CONSTRAINT `book_truyenyeuthich_id_nguoi_dung_id_12aa27b7_fk_book_thon` FOREIGN KEY (`id_nguoi_dung_id`) REFERENCES `book_thongtinnguoidung` (`id`),
  ADD CONSTRAINT `book_truyenyeuthich_id_truyen_id_0445e9a3_fk_book_truyen_id` FOREIGN KEY (`id_truyen_id`) REFERENCES `book_truyen` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
