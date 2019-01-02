require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end    
  end

  describe '#release bike' do
    it 'releases working bikes' do
      subject.dock(String.new("I am a bike"))
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it 'raises an error if bike is broken' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
    
    it 'raises an error when dock is empty' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end
  
  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#dock' do
    it 'raises an error when dock is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'Docking station full'
    end
  end
  
end
