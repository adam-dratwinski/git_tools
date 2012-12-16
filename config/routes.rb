Cuba.define do
  on get do
    on root do
      res.write render("#{APP_PATH}/app/views/index.html.haml", content: "hello, world")
    end
  end
end
