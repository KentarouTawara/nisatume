RakutenWebService.configure do |config|
  # (必須) アプリケーションID
  config.application_id = '1072995584661174169'

  # (任意) 楽天アフィリエイトID
  config.affiliate_id = '1cc39bfa.8872cba0.1cc39bfb.aedeac29' # default: nil

# (任意) リクエストのリトライ回数
# 一定期間の間のリクエスト数が制限を超えた時、APIはリクエスト過多のエラーを返す。
# その後、クライアントは少し間を空けた後に同じリクエストを再度送る。
  config.max_retries = 3 # default: 5

# (任意) デバッグモード
# trueの時、クライアントはすべてのHTTPリクエストとレスポンスを
# 標準エラー出力に流す。
  config.debug = true # default: false

end