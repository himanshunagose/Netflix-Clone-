import '../models/movie_model.dart';

// Using high quality placeholder images from Unsplash/TMDB style sources
const _baseImg = "https://images.unsplash.com/photo-";

final List<Movie> dummyMovies = [
  const Movie(
    id: '1',
    title: 'Cyberpunk: Edgerunners',
    description:
        'In a dystopia riddled with corruption and cybernetic implants, a talented but reckless street kid strives to become a mercenary outlaw — an edgerunner.',
    posterUrl:
        '${_baseImg}1536440136628-849c177e76a1?auto=format&fit=crop&w=600&q=80', // Cyberpunk vibes
    backdropUrl:
        '${_baseImg}1536440136628-849c177e76a1?auto=format&fit=crop&w=1200&q=80',
    rating: 4.8,
    year: '2022',
    duration: '10 eps',
    genre: 'Anime',
    cast: ['Kenichiro Ohashi', 'Aoi Yuki', 'Kazuhiko Inoue'],
    isSeries: true,
  ),
  const Movie(
    id: '2',
    title: 'Interstellar',
    description:
        'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
    posterUrl:
        '${_baseImg}1506318137071-a8bcbf6755dd?auto=format&fit=crop&w=600&q=80', // Space vibes
    backdropUrl:
        '${_baseImg}1446776811953-523824f10736?auto=format&fit=crop&w=1200&q=80',
    rating: 4.9,
    year: '2014',
    duration: '2h 49m',
    genre: 'Sci-Fi',
    cast: ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'],
    isSeries: false,
  ),
  const Movie(
    id: '3',
    title: 'The Dark Knight',
    description:
        'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    posterUrl:
        '${_baseImg}1509347528160-9a9e33742cd4?auto=format&fit=crop&w=600&q=80', // Dark city vibes
    backdropUrl:
        '${_baseImg}1478720529130-96779f129f11?auto=format&fit=crop&w=1200&q=80',
    rating: 4.9,
    year: '2008',
    duration: '2h 32m',
    genre: 'Action',
    cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
    isSeries: false,
  ),
  const Movie(
    id: '4',
    title: 'Stranger Things',
    description:
        'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back.',
    posterUrl:
        '${_baseImg}1626814026160-2237a95fc5a0?auto=format&fit=crop&w=600&q=80', // Retro sci-fi
    backdropUrl:
        '${_baseImg}1518709268805-4e9042af9f23?auto=format&fit=crop&w=1200&q=80',
    rating: 4.7,
    year: '2016',
    duration: '4 Seasons',
    genre: 'Horror',
    cast: ['Millie Bobby Brown', 'Finn Wolfhard', 'Winona Ryder'],
    isSeries: true,
  ),
  const Movie(
    id: '5',
    title: 'Dune: Part Two',
    description:
        'Paul Atreides unites with Chani and the Fremen while on a warpath of revenge against the conspirators who destroyed his family.',
    posterUrl:
        '${_baseImg}1541963463532-d68292c34b19?auto=format&fit=crop&w=600&q=80', // Desert vibes
    backdropUrl:
        '${_baseImg}1541963463532-d68292c34b19?auto=format&fit=crop&w=1200&q=80',
    rating: 4.8,
    year: '2024',
    duration: '2h 46m',
    genre: 'Sci-Fi',
    cast: ['Timothee Chalamet', 'Zendaya', 'Rebecca Ferguson'],
    isSeries: false,
  ),
];

final List<Movie> trendingMovies = [
  dummyMovies[4],
  dummyMovies[0],
  dummyMovies[1],
];
final List<Movie> newReleases = [dummyMovies[4], dummyMovies[1]];
final List<Movie> topRated = [dummyMovies[2], dummyMovies[1], dummyMovies[0]];
