# frozen_string_literal: true
User.destroy_all
Group.destroy_all
Movie.destroy_all
User.create(email: 'test@fake.com', password: 'faketest', name: 'Faker', group: Group.create)
User.create(email: 'test1@fake.com', password: 'faketest', name: 'Faker', group_id: 1)
Movie.create(
  [
    { name: '3 Days to Kill', streaming_services: ['plex'], length: 122, image_url: 'https://imdb-api.com/posters/original/sliYPOgeUuf62qktgXbfMBmYvj1.jpg' },
    { name: '3:10 to Yuma', streaming_services: ['plex'], length: 122, image_url: 'https://m.media-amazon.com/images/M/MV5BODE0NTcxNTQzNF5BMl5BanBnXkFtZTcwMzczOTIzMw@@._V1_.jpg' },
    { name: '6 Bullets', streaming_services: ['plex'], length: 110, image_url: 'https://imdb-api.com/posters/original/wydggKafirsqdPHzGGN1jZ2f8xf.jpg' },
    { name: '8 Mile', streaming_services: ['plex'], length: 110, image_url: 'https://imdb-api.com/posters/original/7BmQj8qE1FLuLTf7Xjf9sdIHzoa.jpg' },
    { name: '9', streaming_services: ['plex'], length: 79 },
    { name: '10 Things I Hate About You', streaming_services: ['plex'], length: 97, image_url: 'https://m.media-amazon.com/images/M/MV5BMmVhZjhlZDYtMDAwZi00MDcyLTgzOTItOWNiZjY0YmE0MGE0XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg' },
    { name: '12 Monkeys', streaming_services: ['plex'], length: 129, image_url: 'https://m.media-amazon.com/images/M/MV5BN2Y2OWU4MWMtNmIyMy00YzMyLWI0Y2ItMTcyZDc3MTdmZDU4XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg' },
    { name: '12 Strong', streaming_services: ['plex'], length: 129, image_url: 'https://imdb-api.com/posters/original/j18021qCeRi3yUBtqd2UFj1c0RQ.jpg' },
    { name: 'The 13th Warrior', streaming_services: ['plex'], length: 102, image_url: 'https://imdb-api.com/posters/original/7pyhR5K1iv67daYw0DfsmsersKA.jpg' },
    { name: '21', streaming_services: ['plex'], length: 122, image_url: 'https://imdb-api.com/posters/original/efG8Po57alqSlhqHU1lXJ3duG6t.jpg' },
    { name: '21 Grams', streaming_services: ['plex'], length: 124, image_url: 'https://imdb-api.com/posters/original/wZ0l6or5juuVWqDkLEgaghs4f9l.jpg' },
    { name: '21 Jump Street', streaming_services: ['plex'], length: 109, image_url: 'https://imdb-api.com/posters/original/8v3Sqv9UcIUC4ebmpKWROqPBINZ.jpg' },
    { name: '28 Days Later', streaming_services: ['plex'], length: 113, image_url: 'https://imdb-api.com/posters/original/w4SL5hv0qOanrN7GjwNgtjF1RtD.jpg' },
    { name: 'The 40 Year Old Virgin', streaming_services: ['plex'], length: 132, image_url: 'https://imdb-api.com/posters/original/lSpnzNpnbG1hxVhEm5rFiiRW39h.jpg' },
    { name: '42', streaming_services: ['plex'], length: 128, image_url: 'https://imdb-api.com/posters/original/iZ7jVGQWj3eBUdqwAPUlKk0BaS2.jpg' },
    { name: '50 First Dates', streaming_services: ['plex'], length: 99 },
    { name: '300', streaming_services: ['plex'], length: 116, image_url: 'https://imdb-api.com/posters/original/lGv19gokQvgC7jgjWqapIachnxU.jpg' },
    { name: '1917', streaming_services: ['plex'], length: 118, image_url: 'https://imdb-api.com/posters/original/iZf0KyrE25z1sage4SYFLCCrMi9.jpg' },
    { name: '2001: A Space Odyssey', streaming_services: ['plex'], length: 148 },
    { name: '2010', streaming_services: ['plex'], length: 115 },
    { name: 'The A-Team', streaming_services: ['plex'], length: 133, image_url: 'https://imdb-api.com/posters/original/bkAWEx5g5tvRPjtDQyvIZ7LRxQm.jpg' },
    { name: 'A.I. Artificial Intelligence', streaming_services: ['plex'], length: 145, image_url: 'https://imdb-api.com/posters/original/wnUAcUrMRGPPZUDroLeZhSjLkuu.jpg' },
    { name: 'The Accidental Spy', streaming_services: ['plex'], length: 83, image_url: 'https://imdb-api.com/posters/original/fPW4Qn9wm82uOexHMB3TC8x6lRU.jpg' },
    { name: 'The Accountant', streaming_services: ['plex'], length: 127, image_url: 'https://imdb-api.com/posters/original/nztAld019tFjllW7VCJvPFiFkt8.jpg' },
    { name: 'The Adventures of Tintin', streaming_services: ['plex'], length: 106, image_url: 'https://imdb-api.com/posters/original/mKYkNro2btaWMsnYSuyqrBdHQo3.jpg' },
    { name: 'Air Force One', streaming_services: ['plex'], length: 124, image_url: 'https://imdb-api.com/posters/original/evO1iENjLpUnbwjnt5XK85jRYob.jpg' },
    { name: 'Airheads', streaming_services: ['plex'], length: 92, image_url: 'https://imdb-api.com/posters/original/caztkbLTC3GHkVljVsPHiTVh9Pl.jpg' }
  ]
)