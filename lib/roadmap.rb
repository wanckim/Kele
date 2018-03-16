module Roadmap
  def get_roadmap(chain_id)
    values = { "id": chain_id }

    response = self.class.get("/roadmaps/#{chain_id}", body: values, headers: { "authorization" => @auth_token })
    @roadmap = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    values = { "id": checkpoint_id }

    response = self.class.get("/checkpoints/#{checkpoint_id}", body: values, headers: { "authorization" => @auth_token })
    @checkpoint = JSON.parse(response.body)
  end
end
