shared_examples "unauthenticated access" do
  it "returns unauthorized status" do
    expect(response).to have_http_status(:found)
  end
end
