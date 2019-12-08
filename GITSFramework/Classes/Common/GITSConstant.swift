//
//  Constant.swift
//  GITSFramework
//
//  Created by GITS INDONESIA on 04/01/18.
//  Copyright © 2018 GITS Indonesia. All rights reserved.
//

import Foundation

public enum ConstantOrder {
    case RESET_ORDER
    case PENDING_ORDER
    case CONFIRMED_ORDER
    case DELIVERED_ORDER
    case CANCELLED_ORDER
    case REJECTED_ORDER
    
    public func asString()-> String {
        switch self {
        case .RESET_ORDER:
            return ""
        case .PENDING_ORDER:
            return "pending"
        case .CONFIRMED_ORDER:
            return "confirmed"
        case .DELIVERED_ORDER:
            return "delivered"
        case .CANCELLED_ORDER:
            return "cancelled"
        case .REJECTED_ORDER:
            return "rejected"
        }
    }
}

public struct TextConstant {
    
    public static let EMAIL_INVALID = "Email tidak valid"
    public static let RECONNECTING = "RECONNECTING"
    public static let LOGOUT_PROGRESS = "Sedang Logout, mohon tunggu sebentar"
    public static let MY_TRIP_GENERAL = "Tiket yang Anda Bayarkan sudah termasuk Iuran Wajib Jasa Raharja."
    public static let MY_TRIP_PERSONAL_ACTIVE = "Terima Kasih Telah Melakukan Pembayaran Sumbangan Wajib (SWDKLLJ) Sesuai UU No. 34 Tahun 1964. Jasa Raharja Menjamin Pihak Ketiga yang menjadi korban kecelakaan lalu lintas jalan akibat penggunaan kendaraan ini."
    public static let MY_TRIP_PERSONAL_INACTIVE = "Segera Lakukan Pembayaran Sumbangan Wajib (SWDKLLJ) Sesuai UU No. 34 Tahun 1964."
    public static let MY_TRIP_PUBLIC_ACTIVE = "Kendaraan ini masih memiliki masa laku Iuran Wajib (IWKBU) Sesuai UU No. 33 Tahun 1964. Jasa Raharja Menjamin Penumpang yang menjadi korban kecelakaan lalu lintas jalan akibat penggunaan kendaraan ini."
    public static let MY_TRIP_PUBLIC_INACTIVE = "Kendaraan telah habis masa laku Iuran Wajib (IWKBU) Sesuai UU No. 33 Tahun 1964."
}

public struct ColorConstant {
    public static let darkBlue = "#00AEEF"
    public static let lightBlue = "#2484C6"
}

public struct TNCConstant {
    public static let profileTNC = [["Syarat dan Ketentuan (01/09/2019)", "PENTING: Anda diwajibkan untuk membaca Syarat dan Ketentuan Penggunaan (“Ketentuan Penggunaan”) ini dan Kebijakan Privasi kami dengan hati-hati dan seksama sebelum mengakses portal dan/atau aplikasi JRku (“Aplikasi”) maupun menggunakan setiap fitur dan/atau layanan yang tersedia dalam Aplikasi (“Layanan”). Dengan mengunduh, mengakses dan/atau menggunakan Aplikasi, Anda setuju bahwa Anda telah membaca, memahami, mengetahui, menyetujui, dan menerima seluruh informasi, syarat, dan ketentuan penggunaan Layanan yang terdapat dalam Ketentuan Penggunaan ini. Ketentuan Penggunaan ini merupakan suatu perjanjian yang sah antara PT Jasa Raharja (“Kami”) dan Anda terkait tata cara dan persyaratan penggunaan Aplikasi yang berlaku antara Anda dan Kami. Anda dapat menghapus Aplikasi dalam perangkat mobile Anda, termasuk mengajukan permintaan penghapusan akun (apabila Anda telah melakukan pendaftaran sebagai pengguna Aplikasi), jika Anda tidak setuju terhadap Ketentuan Penggunaan ini. Mohon diperhatikan bahwa penggunaan Aplikasi tunduk pada Ketentuan Penggunaan dan Kebijakan Privasi yang Kami keluarkan dan/atau perbaharui dari waktu ke waktu."], ["Ketentuan Umum", "Aplikasi ini merupakan milik PT Jasa Raharja (Persero). Kami bekerja sama dengan pihak ketiga (“Mitra Kami”) untuk mengembangkan, menambah dan/atau mening- katkan fitur serta fungsi dalam Aplikasi, dan/atau menyediakan produk dan/atau layanan.", "Pengunduhan dan/atau penggunaan Aplikasi ini bebas biaya. Koneksi kepada jaringan internet diperlukan untuk dapat menggunakan Layanan ini. Segala biaya yang timbul atas koneksi perangkat mobile Anda dengan jaringan internet sepenuhnya ditanggung oleh Anda.", "Aplikasi ini dapat digunakan oleh Anda dengan terlebih dahulu melakukan pendaftaran yang disertai pemberian informasi data pribadi Anda sebagaimana diminta dalam Aplikasi (“Data Pribadi”). Informasi terkait Data Pribadi yang diberikan hanya akan digunakan untuk pemberian Layanan dan tujuan lain yang dimuat dalam Kebijakan Privasi. Informasi tambahan wajib Anda berikan untuk dapat mempergunakan Layanan tertentu dalam Aplikasi. Hal-hal terkait Data Pribadi diatur dalam Kebijakan Privasi sebagai bagian dari Ketentuan Penggunaan ini.", "Aplikasi ini bertujuan untuk memberikan informasi secara umum terkait dengan produk dan layanan yang disediakan oleh Kami maupun Mitra Kami termasuk setiap berita yang relevan serta program promosi yang diberlakukan apabila ada. Kami senantiasa berupaya untuk menjaga kebenaran dan kekinian dari informasi tersebut. Kami tidak membuat pernyataan atau memberikan jaminan apapun, baik tersurat maupun tersirat, mengenai kelengkapan, akurasi, keandalan, kesesuaian, kepuasan, keamanan, kecepatan, ketersediaan fitur, informasi, produk, layanan, gambar, estimasi biaya atau grafis terkait yang terdapat dalam Aplikasi untuk setiap tujuan apapun juga. Gambar, grafis dan/atau foto yang ada dalam Aplikasi mungkin tunduk terhadap suatu hak kekayaan intelektual yang dimiliki oleh pihak ketiga dan Kami tidak menjamin dalam bentuk apapun juga atas hak tersebut.", "Dalam penggunaan Aplikasi ini, Anda dapat memiliki pilihan dan kesempatan untuk tersambung, terakses, atau terhubung dengan Application Programming Interface (“API”) dan/atau Uniform Resource Locator (“URL”) pihak ketiga dan/atau afiliasi Kami dan/atau Mitra Kami yang tidak berada di bawah kendali Kami. Kami tidak memiliki kontrol atas sifat, isi dan ketersediaan dari API dan/atau URL tersebut. Ketersediaan setiap API dan/atau URL dalam Aplikasi ini tidak menyiratkan bahwa Kami merekomen- dasikan  API dan/atau URL tersebut atau mendukung dan/atau menyetujui pandangan yang diungkapkan dan/atau dinyatakan dalam API dan/atau URL pihak ketiga dan/atau afiliasi Kami dan/atau Mitra Kami.", "Penggunaan beberapa Layanan tertentu dalam Aplikasi mensyaratkan Anda untuk mengaktifkan fungsi geolocation dalam perangkat mobile Pengaktifan fungsi geolocation ini diperlukan untuk mempermudah Kami dalam mendeteksi lokasi Anda agar Kami dapat menyediakan Layanan tertentu di tempat keberadaan Anda saat itu (“Current Location”).", "Kami memiliki kebijakan sendiri dan menyeluruh untuk menerima atau menunda atau menolak permintaan Anda atas Layanan.", "Dalam penyediaan Layanan ini, Kami dapat bekerja sama dengan Mitra Kami. Semua risiko dan kerugian yang mungkin ditimbulkan oleh kelalaian Mitra Kami (termasuk namun tidak terbatas pada penyelesaian transaksi) adalah di luar wewenang dan tanggung jawab Kami."]]
}

public struct FinpayStateConstant {
    public static let reqActivation = "reqActivation"
    public static let reqConfirmation = "reqConfirmation"
    public static let balance = "balance"
    public static let billPayment = "widgetBillPayment"
    public static let topUp = "widgetTopUp"
    public static let transfer = "widgetTransfer"
    public static let finpayHistory = "finpayHistory"
}

public struct PaymentGuideConstant {
    public static let briVATitle: [String] = ["ATM BRI", "Internet Banking BRI", "m-BRI (BRI Mobile)"]
    public static let briVA: [String] =
    ["1. Pada ATM, Pilih opsi <b>Transaksi Lainnya</b>, lalu pilih opsi <b>Transfer</b>.\n2. Kemudian pilih opsi Ke Rekening <b>BRI Virtual Account.</b>\n3. Masukkan nomor rekening <b>BRI Virtual Account.</b>\n4. Periksa <b>Jumlah Bayar</b>, lalu selesaikan pembayaran.",
     "1. Login <b>iBanking</b> BRI, kemudian pilih <b>Pembayaran Tagihan.</b>\n2. Pilih Pembayaran kemudian pilih <b>BRIVA.</b>\n3. Masukkan <b>nomor BRIVA</b> dan <b>Nominal Pembayaran.</b>\n4. Masukkan Password dan <b>mTOken</b>, klik <b>Kirim</b>, & selesaikan pembayaran.",
     "1. Buka aplikasi BRI Mobile, <b>pilih Mobile Banking.</b>\n2. Kemudian pilih <b>Pembayaran</b>, lalu pilih <b>BRIVA.</b>\n3. Masukkan <b>Nomor BRIVA</b> dan <b>Jumlah Pembayaran.</b>\n4. Masukkan <b>PIN</b>, tekan <b>OK/Kirim</b> dan selesaikan Pembayaran."]
    
    public static let bniVATitle: [String] = ["ATM BNI", "iBank Personal BNI", "Mobile Banking BNI", "SMS Banking", "Cabang atau Outlet BNI (Teller)", "Agen46", "ATM Bersama", "Bank Lain", "OVO"]
    public static var bniVA: [String] =
    ["1. Masukkan Kartu Anda.\n2. Pilih Bahasa.\n3. Masukkan PIN ATM Anda.\n4. Pilih <b>Menu Lainnya</b>.\n5. Pilih <b>Transfer</b>.\n6. Pilih Jenis rekening yang akan Anda gunakan (Contoh; <b>Dari Rekening Tabungan</b>).\n7. Pilih <b>Virtual Account Billing</b>\n8. Masukkan nomor Virtual Account Anda (contoh: %s).\n9. Tagihan yang harus dibayarkan akan muncul pada layar konfirmasi\n10. Konfirmasi, apabila telah sesuai, lanjutkan transaksi.\n11. Transaksi Anda telah selesai.",
     "1. Ketik alamat https://ibank.bni.co.id kemudian klik <b>Enter</b>.\n2. Masukkan User ID dan Password.\n3. Pilih menu <b>Transfer</b>.\n4. Pilih <b>Virtual Account Billing</b>.\n5. Kemudian masukkan nomor Virtual Account Anda (contoh: %s) yang hendak dibayarkan. Lalu pilih rekening debet yang akan digunakan. Kemudian tekan <b>lanjut</b>.\n6. Kemudian tagihan yang harus dibayarkan akan muncul pada layar konfirmasi.\n7. Masukkan Kode Otentikasi Token.\n8. Pembayaran Anda Telah Berhasil.",
    "1. Akses BNI Mobile Banking dari handphone kemudian masukkan user ID dan password.\n2. Pilih menu <b>Transfer</b>.\n3. Pilih menu <b>Virtual Account Billing</b> kemudian pilih rekening debet.\n4. Masukkan nomor Virtual Account Anda (contoh: %s) pada menu <b>input baru</b>.\n5. Tagihan yang harus dibayarkan akan muncul pada layar konfirmasi.\n6. Konfirmasi transaksi dan masukkan Password Transaksi.\n7. Pembayaran Anda Telah Berhasil.",
    "1. Buka aplikasi SMS Banking BNI\n2. Pilih menu Transfer\n3. Pilih menu Trf rekening BNI\n4. Masukkan nomor rekening tujuan dengan 16 digit Nomor Virtual Account (contoh:%s).\n5. Masukkan nominal transfer sesuai tagihan atau kewajiban Anda. Nominal yang berbeda tidak dapat diproses.\n6. Pilih <b>Proses</b> kemudian <b>Setuju</b>\n7. Reply sms dengan ketik pin sesuai perintah\n8. Transaksi Berhasil\nAtau Dapat juga langsung mengetik sms dengan format:\n<b>TRF[SPASI]NomorVA[SPASI]NOMINAL</b>\ndan kemudian kirim ke 3346\nContoh : TRF %s",
    "1. Kunjungi Kantor Cabang/outlet BNI terdekat\n2. Informasikan kepada Teller, bahwa ingin melakukan pembayaran <b>Virtual Account Billing</b>\n3. Serahkan nomor Virtual Account Anda kepada Teller\n4. Teller melakukan konfirmasi kepada Anda.\n5. Teller memproses Transaksi\n6. Apabila transaksi Sukses Anda akan menerima bukti pembayaran dari Teller tersebut.",
    "1. Kunjungi Agen46 terdekat (warung/took/kios dengan tulisan Agen46)\n2. Informasikan kepada Agen46, bahwa ingin melakukan pembayaran <b>Virtual</b>\n3. Serahkan nomor Virtual Account Anda kepada Agen46\n4. Agen46 melakukan konfirmasi kepada Anda.\n5. Agen46 Proses Transaksi\n6. Apabila transaksi Sukses Anda akan menerima bukti pembayaran dari Agen46 tersebut.",
    "1. Masukkan kartu ke mesin ATM Bersama.\n2. Pilih <b>Transaksi Lainnya</b>.\n3. Pilih menu <b>Transfer</b>.\n4. Pilih <b>Transfer ke Bank Lain</b>.\n5. Masukkan kode bank BNI (009) dan 16 Digit Nomor Virtual Account (contoh: %s).\n6. Masukkan nominal transfer sesuai tagihan atau kewajiban Anda. Nominal yang berbeda tidak dapat diproses.\n7. Konfirmasi rincian Anda akan tampil di layar, cek dan tekan <b>Ya</b> untuk melanjutkan.\n8. Transaksi Berhasil.",
    "1. Pilih menu <b>Transfer antar bank</b> atau <b>Transfer online antarbank</b>\n2. Masukkan kode bank BNI (009) atau pilih bank yang dituju yaitu BNI.\n3. Masukkan 16 Digit Nomor Virtual Account pada kolom rekening tujuan, (contoh: %s).\n4. Masukkan nominal transfer sesuai tagihan atau kewajiban Anda. Nominal yang berbeda tidak dapat diproses.\n5. Masukkan jumlah pembayaran : 44000.\n6. Konfirmasi rincian Anda akan tampil di layar, cek dan apabila sudah sesuai silahkan lanjutkan transaksi sampai dengan selesai.\n7. Transaksi Berhasil.",
    "1. Buka aplikasi OVO\n2. Pilih menu Transfer\n3. Pilih <b>Rekening Bank</b>\n4. Masukkan kode bank BNI (009) atau pilih bank yang dituju yaitu BNI.\n5. Masukkan 16 Digit Nomor Virtual Account pada kolom rekening tujuan, (contoh: %s).\n6. Masukkan nominal transfer sesuai tagihan atau kewajiban Anda\n7. Pilih <b>Transfer</b>\n8. Konfirmasi rincian Anda akan tampil di layar, cek dan apabila sudah sesuai silahkan pilih <b>Konfirmasi</b> untuk lanjutkan transaksi sampai dengan selesai\n9. Transaksi Berhasil"]
}

public struct IWKBUConstant {
    // MARK: - General
    public static let IWKBU_CANCEL_PROFILE = "Anda yakin untuk membatalkan perubahan?"
    public static let IWKBU_SAVE_PROFILE = "Anda yakin untuk menyimpan perubahan pada data"
    public static let IWKBU_CANCEL_PASSENGER = "Anda yakin untuk membatalkan pembaruan?"
    public static let IWKBU_SAVE_PASSENGER = "Anda yakin untuk menyimpan pembaruan pada"
    public static let IWKBU_SAVE_STATUS = "Anda yakin untuk menyimpan Status Kendaraan?"
    public static let IWKBU_CANCEL_STATUS = "Anda yakin untuk membatalkan?"
    public static let OWNER = "Pemilik"
    public static let MANAGER = "Pengurus"
    public static let ADDRESS = "Alamat PO"
    public static let LICENSING = "Perizinan Angkutan"
    public static let PASSENGER = "Data Angkutan Penumpang"
    
    // MARK: - Onboarding
    public static let ONBOARDING_TITLE = ["Memperkenalkan IWKBU 2.0!", "Halaman Perusahaan", "Halaman Kendaraan", "Halaman Transaksi"]
    public static let ONBOARDING_IMG = ["ic-onboarding-1", "ic-onboarding-2", "ic-onboarding-3", "ic-onboarding-4"]
    public static let ONBOARDING_DESC = ["IWKBU kini hadir dengan tampilan dan fitur baru yang akan lebih memudahkan Anda!", "Sekarang perusahaan Anda terdata dengan lebih lengkap dan rapi, dari profil perusahaan hingga mapping kendaraan", "Sekarang kendaraan memiliki informasi yang lebih lengkap dan Anda dapat lebih mudah melihat status kendaraan", "Transaksi Anda sekarang tercatat dengan lebih rapi, lengkap dan mudah diakses."]
    
    // MARK: - Cell ID
    public static let COMPANY_VC_CELL = ["IWKBUProfileEmptyCell", "IWKBUAdditionalCell", "IWKBUProfileHeaderCell", "IWKBUProfileMenuCell", "IWKBUProfilePOCell", "IWKBUProfilePersonalCell", "IWKBUProfilePaymentCell"]
    public static let MAPPINGPO_VC_CELL = ["IWKBUProfileHeaderCell", "IWKBUMappingPOCell"]
    public static let VEHICLELIST_VC_CELL = ["IWKBUProfileHeaderCell", "IWKBUVehicleListCell"]
    public static let VEHICLEPROFILE_VC_CELL = ["IWKBUProfileVehicleCell", "IWKBUProfileExpandCell", "IWKBUProfilePassengerCell", "IWKBUProfileHistoryCell", "IWKBUProfileStatusCell", "IWKBUProfileVehicleEmptyCell"]
    public static let CREATESTATUS_VC_CELL = ["IWKBUEmptyEvidenceCell", "IWKBUStatusEvidenceCell"]
    public static let TRANSACTION_VC_CELL = ["IWKBUProfileHeaderCell", "IWKBUTrxItemCell", "IWKBUTrxHistoryHeaderCell", "IWKBUTrxHistoryItemCell"]
    public static let PAYMENTLIST_VC_CELL = ["IWKBUPaymentListCell"]
    public static let FILTER_VEHICLE_CELL = ["IWKBUFilterMappingCell", "IWKBUFilterStatusCell", "IWKBUFilterPeriodCell", "IWKBUFilterDateCell"]
    public static let PAYMENT_CONFIRMATION_CELL = ["IWKBUPayConfirmMethodHeaderCell", "IWKBUPayConfirmMethodNameCell", "IWKBUPayConfirmMethodTitleCell", "IWKBUPayConfirmOtherCell", "IWKBUPayConfirmVehicleCell"]
    public static let TRX_DETAILS_CELL = [ "IWKBUPayConfirmVehicleCell", "IWKBUPayConfirmOtherCell", "IWKBUTrxDetailsVACell", "IWKBUTrxDetailsTransferCell", "IWKBUTrxDetailsGuideCell", "IWKBUTrxDetailsTypeCell", "IWKBUTrxDetailsMethodCell", "IWKBUTrxDetailsStepCell"]
    
    // MARK: - Status Type
    public static let STATUS_TYPE =  ["Informasi Umum", "Kendaraan Tidak Layak", "Informasi Ubah Fungsi Kendaraan", "Perbaikan Di Bengkel", "Informasi Dijual", "Informasi Lainya"]
    public static let EVIDENCE_NOTES =  ["Kendaraan Tampak Depan", "Kendaraan Tampak Samping", "Kendaraan Tampak Belakang", "Bukti Pembayaran", "Keterangan Lainnya"]
    
    // MARK: - Month List
    public static let MONTH_LIST = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"]
}
