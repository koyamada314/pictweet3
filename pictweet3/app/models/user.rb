class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nickname, presence: true, length: { maximum: 6 }
  has_many :tweets
  has_many :comments
  has_many :footprints, class_name: "Footprint", foreign_key: "host_id"   #Footprintテーブルを利用し、host_idに訪問された人のidを保存
  has_many :hosts, through: :footprints, source: :host           #上記の記述に加え、今度はFootprintテーブルを中間テーブルと捉え、訪問された人のidを全件取得できるようにする
  has_many :footprints, class_name: "Footprint", foreign_key: "visitor_id"   #Footprintテーブルを中間テーブルとし、visitor_idに訪問した人のidを保存
  has_many :visitors, through: :footprints, source: :visitor    ##上記の記述に加え、今度はFootprintテーブルを中間テーブルと捉え、訪問してきた人のidを全件取得できるようにする

end
