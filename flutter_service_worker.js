'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "dfd822c1931399169d4cafa9accd4c3e",
".git/config": "bc97fabf46a964f3634c13330da25937",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "7d95d7c22a7a7a42d9c3650bb7bf2e09",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "4ed5a9958b314829bded82925331f1cd",
".git/logs/refs/heads/gh-pages": "4ed5a9958b314829bded82925331f1cd",
".git/logs/refs/remotes/origin/gh-pages": "78cdc22f1337d28164af9e0a1318a3da",
".git/objects/0a/2305548baa5a069ade7a4fea57ae3d1d5ca51d": "304579acca57ea5e4016e154fe400a4b",
".git/objects/11/66be6d017c0f8ccfc654b0a83b61051e101063": "6f1ba79db6d8ee492256a8ed3b7c5703",
".git/objects/17/3d2ad4775849fab8154e35d928171f8547f1d9": "4000194a45c28c0aef740d2a14e47e87",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/1c/15c431932dd7c88cbdc9927097789bbe9b9f81": "a06695ec2b38052985b4685ca99d4742",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/23/c3243abe54ad964f0d05d5138b369965aaee38": "e27fafca983ba8f311ba4040af72d550",
".git/objects/27/e64c007d16ea88f11f04d24b58ceecd463779d": "168fb86db885a65f75c886bdbeee6d2d",
".git/objects/29/7dc43569b1cede27cdb3d157063dcdac1d24e8": "96ab7987a554962eb46cd62f62e6fc29",
".git/objects/4a/9ffc5860fab64b1a049c41875cc7b62b96e333": "65ed3a6157eb1f1d2be6382cd933e356",
".git/objects/4b/10ca64cc5e4eec358059bec3ce34d025ec2e86": "923c5b58fdf6304224749c2e584d4264",
".git/objects/4c/51fb2d35630595c50f37c2bf5e1ceaf14c1a1e": "a20985c22880b353a0e347c2c6382997",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/59/614384783bca8061aa8fc75eebedfb80b2b016": "f0ec8dda71b238ae77409964eb679d27",
".git/objects/59/62efb2dffef4c259bda261b128fcab4b659c34": "11e1a7683fedc73b6a0da57ee3c6a112",
".git/objects/63/133399f2c139dba404b0dc4af50e9e704781db": "7f9583927ebc39f58a13261badbdfda8",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6e/59d9cc7cc7ac71eb44e1a172a27d567365cae0": "09912cf1410629526431e8f4f8081cac",
".git/objects/6f/7d5f276ab0864a38dfdd2f3d46c56f699d9103": "c69ad3ad822a9b0ca3e94a4cc070166c",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/72/47d77770763c80f5d5fee9dda98f957ab8847d": "b385ae7acd90d10f5f748d4cf12a4717",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/3c7d6bbbef6e7cefcdd4df877e7ed0ee4af46e": "025a3d8b84f839de674cd3567fdb7b1b",
".git/objects/8f/22644b3e238142b6b9834fcd6ea2b48751df4a": "ae7b27bebfd03edc645243420b6a1d13",
".git/objects/9b/8ba1a453289c6d4266df0eeffd452c816f09ce": "4e2dcb037e847e87ddb34443fe639868",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/9c/b5dbd15fcf5232ff2b1b28d96f56acab856d27": "93ed25eda8fd40fe2ef5a0a4dcb9ad91",
".git/objects/9e/e1919dc230d3433cce79d137c37081c974034a": "7918dcf5b15c1ac607255918935ca48a",
".git/objects/9e/ff511af9505d3f153182a4fc0ebd0eb3191814": "59144eb06fd3d8d7aa165f2bcd151c9c",
".git/objects/a0/6478661cfe3a3f501bb0f54d79fb7e4b63c887": "0b4837e24bef9acf13c7584ab162fb82",
".git/objects/a1/d0c2360501d1d7b6578ba84079e688e7715cd7": "9443f55aa139ee26e528b5ccb85a78d1",
".git/objects/aa/20a391499bc0437a8e8d742b62cd74beb34152": "84b562c19d5d51709ec32dd3b930fae4",
".git/objects/ad/e39b75c9fb0e4352b71460d60b992c0d3afc2f": "f51ea21837331ad25cc4c14e37b474c7",
".git/objects/b6/64d99dffb145b4fed0d58ea3e4075ff8a9dc74": "5516877e0b0349f3bea632e612c8f69f",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/d2/ac805aeae8b3d92b91cf2b1ad35bd0676dbbe8": "f873958db7c51f00ed1a3d8fa251b8cd",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/802cfb172fa0beae7dd7e649b37d5bf67002ea": "581de11ef6b9bb19be9b5e029f2fd410",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/dd/3218cc25c7f8b47c7e2024111ddb5e595778d8": "9eea78cf486be14b4cec25035a6fe0d4",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/e3/56d3542eebd4f4a5f3fd72a17f5c588bd5cfb3": "9be96e120211ad205b0576e9bef58a8b",
".git/objects/e5/817c8a0c67fb19dd204f25f77a85e27eb861f6": "c19809fb51743bed203de6490af20cfe",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/ea/a4ee5814ad5ab7d22338e92f0cde2c2a2acd09": "2ecf7a7107c5c9b1d0a84dab80b21d0b",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/ac0808dcdd4de748e25beb617da85d196c7772": "6b003733dfed439f15cec1122e32e011",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/5f7100711c46ed9b90377a6e75e707588cc099": "b7a9f04f37e85cdbc8d6c98022048c69",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f8/eafca47fb39c4addb6b4f0ab03cd1033fba8cd": "ecee603b96cb64fd7028455a934c1129",
".git/objects/f9/68ef433fd34322f81d24f35a51b8ebdbd4dabc": "296cb8febe06d83cedef41565f429ea6",
".git/objects/fe/3914bcf3baf9d87a873a444cac8aaf9dcd54c1": "372add7dd6cdabc32b9333e8d66bff72",
".git/refs/heads/gh-pages": "bc9d39afd3f19ba939a3351b2bc3768c",
".git/refs/remotes/origin/gh-pages": "bc9d39afd3f19ba939a3351b2bc3768c",
"assets/AssetManifest.bin": "61fa1f6ae0ec38e8f9403ace04513254",
"assets/AssetManifest.bin.json": "ed0f6372d488e942994f05033cde98d3",
"assets/AssetManifest.json": "23c3522e38106debc0ffe6247cf3129c",
"assets/assets/images/logo.png": "3892a50c81ab8dae4c43ecafa8784048",
"assets/assets/images/profile.png": "8464826d795c3a32fff669b37aba806d",
"assets/assets/images/weatherapp_imgs/cmps.jpeg": "a2cafd9bc122b14126e77e0384b6d9fb",
"assets/assets/images/weatherapp_imgs/forecast.jpeg": "eff1a306a387a84423c9998213b0b403",
"assets/assets/images/weatherapp_imgs/home.jpeg": "256e559bda20efc1371af849f246d0f8",
"assets/assets/images/weatherapp_imgs/humidity.jpeg": "f01977347c2b5e6c3449082f2a13b4c1",
"assets/assets/images/weatherapp_imgs/setting.jpeg": "4ec9ca2abb6a8e99663f697829589d9c",
"assets/assets/images/weatherapp_imgs/ther.jpeg": "04cde1c535b65c353f84fa6bdf946cdc",
"assets/assets/images/weatherapp_imgs/timing.jpeg": "6b87ce28aadd0e4fae447e5eeca7e690",
"assets/assets/images/weatherapp_imgs/wind.jpeg": "cf7e937cfcaf912612a3eda5a971317a",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "ddf0cbe4327a8542fa84d31bc78951c6",
"assets/NOTICES": "1ef107612c84e8a777147b004647c444",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "2e3dc24ddcbd67d0d93b88dc6883a453",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "262525e2081311609d1fdab966c82bfc",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b023a4502f2132e9191d0f60b61ad2f8",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "d5e6d148808038a1d0e797e1583da9b8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "c59b92b6f60c4ddc7fe46c5f2edded5c",
"/": "c59b92b6f60c4ddc7fe46c5f2edded5c",
"main.dart.js": "32d97f44a1f23707e8d3d090d14e1834",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
