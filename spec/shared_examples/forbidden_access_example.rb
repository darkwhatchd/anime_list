shared_examples "forbidden access" do
  it "returns error message" do
    expect(flash[:alert]).to eq "You are not authorized to perform this action."
  end

  it "returns forbidden status" do
    expect(response).to have_http_status(:found)
  end
end
