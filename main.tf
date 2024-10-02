# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "by_artist" {
  artist = "A.R.Rahman"
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}

resource "spotify_playlist" "playlist" {
  name        = "Terraform Summer Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    data.spotify_search_track.by_artist.tracks[0].id,
    data.spotify_search_track.by_artist.tracks[1].id,
    data.spotify_search_track.by_artist.tracks[2].id,
  ]
}

data "spotify_search_track" "devara1" {
  artist = "Anirudh Ravichander"
    album = "Devara Part1"
  #  name  = "Early Morning Breeze"
}

resource "spotify_playlist" "devara" {
  name        = "Devara"
  description = "This playlist was created by Terraform for Devara"
  public      = true

  tracks = [
    data.spotify_search_track.devara1.tracks[0].id,
    data.spotify_search_track.devara1.tracks[1].id,
    data.spotify_search_track.devara1.tracks[2].id,
  ]
}

data "spotify_search_track" "cs" {
  artist = "Chain Smokers"
    album = "chain smoker"
  #  name  = "Early Morning Breeze"
}

resource "spotify_playlist" "cs" {
  name        = "CS"
  description = "This playlist was created by Terraform for CS"
  public      = true

  tracks = [
    data.spotify_search_track.cs.tracks[0].id,
    data.spotify_search_track.cs.tracks[1].id,
    data.spotify_search_track.cs.tracks[2].id,
  ]
}

data "spotify_search_track" "mani_sharma" {
  artist = "Mani Sharma"
    album = "Mani Sharma Hits"
  #  name  = "Early Morning Breeze"
}

resource "spotify_playlist" "mani_sharma" {
  name        = "Mani Sharma"
  description = "This playlist was created by Terraform for Mani Sharma Hits"
  public      = true

  tracks = [
    data.spotify_search_track.mani_sharma.tracks[0].id,
    data.spotify_search_track.mani_sharma.tracks[1].id,
  ]
}
