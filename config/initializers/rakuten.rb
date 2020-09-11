RakutenWebService.configure do |config|
  config.application_id = Rails.application.credentials.dig(:rakuten, :production, :application_id)
  # (任意) 楽天アフィリエイトID
  config.affiliate_id = Rails.application.credentials.dig(:rakuten, :production, :affiliate_id) # default: nil

  # (任意) リクエストのリトライ回数
  # 一定期間の間のリクエスト数が制限を超えた時、APIはリクエスト過多のエラーを返す。
  # その後、クライアントは少し間を空けた後に同じリクエストを再度送る。
  config.max_retries = 3 # default: 5

  # (任意) デバッグモード
  # trueの時、クライアントはすべてのHTTPリクエストとレスポンスを
  # 標準エラー出力に流す。
  config.debug = true # default: false
end