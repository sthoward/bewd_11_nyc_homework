require 'rails_helper'

RSpec.describe Playlist, :type => :model do
  let(:playlist) {Playlist.create(title: "Moody")}
  let(:user) {User.create(uid: "Scott")}
  let(:track) {Track.create(title: "Title 1", artist: "Artist 1")}

  it "belongs to a user" do
  	user.playlists << playlist
  	playlist.reload
  	expect(playlist.user).to eq user
  end

  it "has tracks" do
  	playlist.tracks << track
  	playlist.reload
  	expect(playlist.tracks.count).to eq 1
  end
end
