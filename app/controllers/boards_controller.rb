# クラス名はキャメルケース コントローラはApplicationControllerを継承
class BoardsController < ApplicationController
  # routeで設定したらアクションと呼ぶ（index action）
  def index
    @boards = Board.all
    # binding.pry
  end

  def new
    # コントローラ内で定義した@インスタンス変数はviewの中でもアクセスできる
    @board = Board.new
    # binding.pry
  end

  def create
    Board.create(board_params)
    # formで送られたpostはparamsの中にある
    # binding.pry
  end
  def show
    @board = Board.find(params[:id])
  end
  def edit
    @board = Board.find(params[:id])
  end
  def update
    # viewを作成しないのでローカル変数
    board = Board.find(params[:id])
    # 更新はupdateメソッド(DBのデータを書き換え)
    board.update(board_params)
    # リダイレクト処理
    redirect_to board
  end

  private
  # フィルター機能　createdatやchangedatを勝手に書き換えられないようにする
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end