require "rails_helper"

describe "ルーティング" do
  example "職員トップページ" do
    config = Rails.application.config.baukis2
    url = "http://#{config[:staff][:host]}/#{config[:staff][:path]}"
    expect(get:url).to route_to(
      host: config[:staff][:host],
      controller: "staff/top",
      action: "index"
    )
  end
  example "管理者ログインフォーム" do
    config = Rails.application.config.baukis2
    url = "http://#{config[:admin][:host]}/#{config[:admin][:path]}/login"
    expect(get:url).to route_to(
      host: config[:admin][:host],
      controller: "admin/sessions",
      action: "new"
    )
  end
end