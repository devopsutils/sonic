require "spec_helper"

describe Sonic::CLI do
  before(:all) do
    @args = "--project-root spec/fixtures/project --noop"
  end

  describe "sonic" do
    it "ssh should print out ssh command to be ran" do
      out = execute("bin/sonic ssh #{@args} --cluster default my-service")
      expect(out).to include("=> ssh")
    end

    it "execute should print that command has been sent" do
      out = execute("bin/sonic execute #{@args} 1,2,3 uptime")
      expect(out).to include("Command sent")
    end

    it "list should list running instances" do
      out = execute("bin/sonic list #{@args} --header 1,2,3")
      expect(out).to include("No instances found")
    end
  end
end
