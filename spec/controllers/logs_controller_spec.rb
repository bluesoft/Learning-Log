require 'spec_helper'

describe LogsController do
  fixtures :users
  
  let(:fulano){users(:fulano)}
  
  def valid_attributes
      {:user_id => 2}
  end

  describe "GET index" do
    it "assigns all user's logs" do
      sign_in fulano
      log = Log.create! valid_attributes
      get :index
      assigns(:logs).should eq([log])
    end
  end

end
