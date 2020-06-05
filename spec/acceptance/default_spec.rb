require 'spec_helper_acceptance'

describe 'vision_logrotate' do
  context 'with defaults' do
    it 'run idempotently' do
      pp = <<-FILE
        class { 'vision_logrotate': }
      FILE

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'packages installed' do
    describe package('logrotate') do
      it { is_expected.to be_installed }
    end
  end

  context 'config deployed' do
    describe file('/etc/logrotate.conf') do
      it { is_expected.to exist }
      it { should be_mode 644 }
      its(:content) { is_expected.to match 'Puppet' }
    end
    describe file('/etc/logrotate.custom.d/firewall') do
      it { is_expected.to exist }
      it { should be_owned_by 'root' }
      its(:content) { is_expected.to match 'weekly' }
    end
    describe file('/etc/logrotate.custom.d/applications') do
      it { is_expected.to exist }
      it { should be_owned_by 'root' }
      its(:content) { is_expected.to match 'weekly' }
    end
    describe file('/etc/logrotate.custom.d/traefik') do
      it { is_expected.to exist }
      it { should be_owned_by 'root' }
      its(:content) { is_expected.to match 'size 10M' }
      its(:content) { is_expected.to match 'sed' }
    end
  end
end
