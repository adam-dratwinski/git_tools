class CommitsController
  def self.index(router, params = {})
    @branch_a = "production"
    @branch_b = "master"
    @store = Store.new
    @store.download

    router.render("#{APP_PATH}/app/views/commits/index.html.haml", store: @store, branch_a: @branch_a, branch_b: @branch_b)
  end
end
