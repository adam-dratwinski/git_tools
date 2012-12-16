Cuba.define do
  on get do
    on root do
      res.write CommitsController.index(self)
    end
  end
end
