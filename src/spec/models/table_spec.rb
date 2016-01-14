require 'rails_helper'

RSpec.describe Table, :type => :model do
  let(:table_name) { 'MyTable' }
  let(:player_estimates) { { player1: 100, player2: 1, player3: 3, player4: 4, playerX: 'Coffee?', playerZ: nil } }
  let(:players) { player_estimates.keys }
  let(:estimates) { player_estimates.values }
  let(:table) { described_class.new(table_name, player_estimates) }

  describe '#name' do
    subject { table.name }
    it { is_expected.to eq(table_name) }
  end

  describe '#players' do
    subject { table.players }

    it { is_expected.to be_a(Array) }
  end

  describe '#player_estimates' do
    subject { table.player_estimates }

    it { is_expected.to eq(player_estimates) }
  end

  describe '#enter' do
    it 'adds players to table' do
      expect { table.enter(:player5) }.to change { table.players.count }.by(1)
    end
  end

  describe '#leave' do
    it 'removes players from table' do
      expect { table.leave(players.first) }.to change { table.players.count }.by(-1)
    end
  end

  describe '#estimate' do
    it 'sets the estimation of the player' do
      expect {
        table.estimate(players.first, 5)
      }.to change {
        table.player_estimates[players.first]
      }.to(5)
    end
  end

  describe '#viable_estimations' do
    subject { table.viable_estimations }

    it { is_expected.to eq([3.0, 4.0]) }

    context 'with too few estimations' do
      let(:player_estimates) { { player1: 5 } }

      it { is_expected.to eq([5.0]) }
    end
  end

  describe '#result' do
    subject { table.result }

    it { is_expected.to be(3.5) }

    context 'with too few estimations' do
      let(:player_estimates) { { player1: 'meh...' } }

      it { is_expected.to be(0) }
    end
  end
end
