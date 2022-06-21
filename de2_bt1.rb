# Câu hỏi
# Viết chương trình quản lý nhân viên như sau:
# Đây là 1 công ty về công nghệ thông tin.
# Trong 1 công ty, Mỗi nhân viên sẽ có tên và mã nhân viên và bộ phận làm việc của nhân viên
# Công ty sẽ có các bộ phận như: dev, qa, BO, infra

# Do tính chất công việc ở mỗi bộ phận khác nhau, nên sẽ có cách tính lương riêng:
# + Dev: Lương cơ bản * số giờ  và được hỗ trợ thêm 15% lương
# + Tester: Lương cơ bản * số giờ  và được hỗ trợ thêm 10% lương
# + Các nhân viên khác: Lương cơ bản * số giờ
# * giả sử lương cơ bản ở đây là 3000

# Ngoài ra, chỉ có nhân viên thuộc bộ phận QA và Dev mới được phép request OT
# Công thức tính request OT là: Số giờ OT * 150% của lương cơ bản

# Bạn hãy đề xuất thiết kế các lớp đối tượng cần thiết để quản lý danh sách các nhân viên của công ty và hỗ trợ tính lương cho nhân viên theo tiêu chí đặt ra như trên.
# Hãy viết chương trình thực hiện các yêu cầu sau:

# 1. Khởi tạo danh sách nhân viên (lưu trữ trong một mảng duy nhất).
# 2. Hiển thị toàn bộ thông tin nhân viên
# 3. Lấy ra mã nhân viên có số lương > 5000
# 4. Thêm mới 1 nhân viên vào danh sách nhân viên hiện có


class NhanVien

  attr_accessor :ma_nv, :ten_nv, :so_gio, :luong, :phong_ban

  $LUONG_CO_BAN = 3000

  def initialize(ma_nv, ten_nv, so_gio)
    @ma_nv = ma_nv
    @ten_nv = ten_nv
    @so_gio = so_gio
    @phong_ban = self.class
  end

  def tinh_luong
    @luong = @so_gio * $LUONG_CO_BAN
  end

  def to_s
    "MaNV: #{@ma_nv} -- TenNV: #{@ten_nv} -- PhongBan: #{@phong_ban} -- SoGio: #{@so_gio} -- Luong: #{@luong} "
  end

end

class Dev < NhanVien

  attr_accessor :so_gio_ot

  def initialize(ma_nv, ten_nv, so_gio, so_gio_ot)
    super(ma_nv, ten_nv, so_gio)
    @so_gio_ot = so_gio_ot
    tinh_luong
  end

  def tinh_luong
    @luong = (@so_gio * $LUONG_CO_BAN + @so_gio * $LUONG_CO_BAN * 0.15 + @so_gio_ot * $LUONG_CO_BAN * 1.15)

  end

  def to_s
    "MaNV: #{@ma_nv} -- TenNV: #{@ten_nv} -- PhongBan: #{@phong_ban} -- SoGio: #{@so_gio} --SoioOT: #{@so_gio_ot}-- Luong: #{@luong} "
  end
end

class QA < NhanVien

  attr_accessor :so_gio_ot

  def initialize(ma_nv, ten_nv, so_gio, so_gio_ot)
    super(ma_nv, ten_nv, so_gio)
    @so_gio_ot = so_gio_ot
    tinh_luong
  end

  def tinh_luong
    @luong = @so_gio * $LUONG_CO_BAN + @so_gio_ot * $LUONG_CO_BAN * 1.15
  end

  def to_s
    "MaNV: #{@ma_nv} -- TenNV: #{@ten_nv} -- PhongBan: #{@phong_ban} -- SoGio: #{@so_gio} --SoioOT: #{@so_gio_ot}-- Luong: #{@luong} "
  end
end

class Tester < NhanVien

  def initialize(ma_nv, ten_nv, so_gio)
    super(ma_nv, ten_nv, so_gio)
    tinh_luong
  end

  def tinh_luong
    @luong = @so_gio * $LUONG_CO_BAN + @so_gio * $LUONG_CO_BAN * 0.1
  end
end

class Other_NhanVien < NhanVien
  def initialize(ma_nv, ten_nv, so_gio)
    super(ma_nv, ten_nv, so_gio)
    tinh_luong
  end
end

def hien_thi_ds_nv(list_nv)
  list_nv.each_with_index do |item, index|
    puts "#{index+1}. #{item.to_s}"
  end
end

def them_nv
  print "Nhap ma nv: "
  ma_nv = gets.chomp

  print "Nhap ten nv: "
  ten_nv = gets.chomp

  print "Nhap so gio(Nhap so): "
  so_gio = gets.chomp.to_i

  print "Nhap ten bo phan [Dev, QA, Tester, ...]: "
  phong_ban = gets.chomp

  if phong_ban.upcase == "DEV" || phong_ban.upcase == "QA"
    print "Nhap so gio OT (Nhap so): "
    so_gio_ot = gets.chomp.to_i

    if phong_ban.upcase == "DEV"
      Dev.new(ma_nv, ten_nv, so_gio, so_gio_ot)
    else
      QA.new(ma_nv, ten_nv, so_gio, so_gio_ot)
    end

  elsif phong_ban.upcase == "TESTER"
    Tester.new(ma_nv, ten_nv, so_gio)
  else
    Other_NhanVien.new(ma_nv, ten_nv, so_gio)
  end
end

def get_nv_luong_5000(lst)

  lst.each do |item|
    if item.luong > 5000
      puts item.ma_nv
    end
  end
end





def run

  listNV = [];

  check = true
  while check do
    puts "chương trình quản lý nhân viên".upcase
    puts "1. Hiển thị toàn bộ thông tin nhân viên."
    puts "2. Lấy ra mã nhân viên có số lương > 5000"
    puts "3. Thêm mới 1 nhân viên vào danh sách nhân viên hiện có"

    print "Nhap yeu cau: "
    choose = gets.chomp().to_i

    case choose
    when 1
      if listNV.length == 0
        puts "DS nhan vien trong!"
      else
        hien_thi_ds_nv(listNV)
      end
    when 2
      get_nv_luong_5000(listNV)
    when 3
      listNV.push(them_nv)
    else
      puts "con lai"
    end
  end
end

run
