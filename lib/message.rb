module Message
  def get_messages(*page)
    if page.length == 0
      values = { "page": 1 }
    else
      values = { "page": page[0] }
    end

    response = self.class.get("/message_threads", body: values, headers: { "authorization" => @auth_token })
    @messages = JSON.parse(response.body)
  end

  def create_message(sender, r_id, text, subject='', token=nil)
    values = {
      "sender": sender,
      "recipient_id": r_id,
      "subject": subject,
      "stripped_text": text
    }

    if token
      values[:"token"] = token
    end

    response = self.class.post("/messages", body: values, headers: { "authorization" => @auth_token })
  end
end
