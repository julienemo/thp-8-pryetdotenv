require_relative '../lib/01_bottwitter'

describe "the login_twitter method" do
  it "should return client, and client is not nil" do
    expect(login_twitter).not_to be_nil
  end
end


describe "programme that really tweets" do
  it "doesn't take negative N" do
    target_range = [ '@gem', '@ORTHOGRAMM', '@Projet_Voltaire', '@Quora', '@ARTEfr', '@operadeparis', '@theatrechatelet', '@polewebmairies', '@Mairiedu4e', '@gadelmaleh', '@lesmisofficial']
    expect(go_tweet(target_range,-5)).to eq("N must be positive integer.")
  end

  it "doesn't take negative N if it is a string" do
    target_range = [ '@gem', '@ORTHOGRAMM', '@Projet_Voltaire', '@Quora', '@ARTEfr', '@operadeparis', '@theatrechatelet', '@polewebmairies', '@Mairiedu4e', '@gadelmaleh', '@lesmisofficial']
    expect(go_tweet(target_range, "moi")).to eq("N must be positive integer.")
  end

  it "doesn't take negative float" do
    target_range = [ '@gem', '@ORTHOGRAMM', '@Projet_Voltaire', '@Quora', '@ARTEfr', '@operadeparis', '@theatrechatelet', '@polewebmairies', '@Mairiedu4e', '@gadelmaleh', '@lesmisofficial']
    expect(go_tweet(target_range, 3.14)).to eq("N must be positive integer.")
  end

  it "doesn't take list shorter than N items" do
    target_range = [ '@gem', '@ORTHOGRAMM', '@Projet_Voltaire', '@Quora', '@ARTEfr', '@operadeparis', '@theatrechatelet', '@polewebmairies', '@Mairiedu4e', '@gadelmaleh', '@lesmisofficial']
    expect(go_tweet(target_range, 750)).to eq("List too short for N.")
  end

end
