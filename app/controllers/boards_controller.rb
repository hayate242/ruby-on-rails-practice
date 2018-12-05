# クラス名はキャメルケース コントローラはApplicationControllerを継承
class BoardsController < ApplicationController

  # defを実行する前に実行するメソッドを定義
  before_action :set_target_board, only: %i[show edit update destroy]
  # after_action around_actionなどもある

  # routeで設定したらアクションと呼ぶ（index action）
  def index
    # @boards = Board.all
    # kaminari ページネーション追加(default= 25 pages)
    @boards = Board.page(params[:page])
    # binding.pry
  end

  def new
    # コントローラ内で定義した@インスタンス変数はviewの中でもアクセスできる
    @board = Board.new(flash[:board])
    # binding.pry
  end

  def create
    board = Board.new(board_params)
    # validationチェック
    if board.save
      # cookieを使う 参照されるまで一時的に保存
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      # formで送られたpostはparamsの中にある
      # binding.pry
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        # 入力したデータをnewに返す
        board: board,
        error_messages: board.errors.full_messages
      }
    end

    
  end
  def show
    # @board = Board.find(params[:id])
  end
  def edit
    # @board = Board.find(params[:id])
  end
  def update
    # viewを作成しないのでローカル変数
    # board = Board.find(params[:id])

    # 更新はupdateメソッド(DBのデータを書き換え)
    @board.update(board_params)
    # リダイレクト処理
    redirect_to board
  end

  def destroy
    # board = Board.find(params[:id])
    @board.delete
    # indexに戻る
    redirect_to boards_path, flash: { notice: "「#{@board.title}の」掲示板が削除されました"}
  end
  private
  # フィルター機能　createdatやchangedatを勝手に書き換えられないようにする
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  # paramsをセット
  def set_target_board
    @board = Board.find(params[:id])
  end
end