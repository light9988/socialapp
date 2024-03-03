'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "6aa8d87e99989e0936fb0e42368330fa",
"index.html": "d548bf39c4b5fd115137c4e07d98c8ff",
"/": "d548bf39c4b5fd115137c4e07d98c8ff",
"main.dart.js": "6c97f6a81a0bd11e78e665f1a0d6a1f5",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "a4a32cc2cff826c8fd8603e05b82527d",
"assets/AssetManifest.json": "83770bdf922f93b8ea065b00d06a9a0e",
"assets/NOTICES": "243d84b73c03daf94abe1dbd85e4ff62",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "a114b2077163e6a4b23022b425f6cc28",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "b8320e5dffeb3fb71ece5a396e49e269",
"assets/fonts/MaterialIcons-Regular.otf": "276663ad610cfd304d253330f457115f",
"assets/assets/images/world.png": "220c490884816db4ced8f2d5196a02a4",
"assets/assets/images/xhs.png": "e985fa1e32302a3af3d4e1e64dd65fa7",
"assets/assets/images/p11.png": "15c76954e31b9cee0c5e5868047fe7f4",
"assets/assets/images/qrcode.png": "7634ab07f3405dab3379c912cc7776c5",
"assets/assets/images/comment2.png": "7f8cbf908fbbc793fd9fc202a23581af",
"assets/assets/images/user.png": "9eaa42f2b71964c900da0294986fa44d",
"assets/assets/images/faved.png": "a9012146a51e0878a2d7d76262b1db33",
"assets/assets/images/liked.png": "1b48a5ac5e1becd1145c4d75ed23d91e",
"assets/assets/images/like.png": "21491f75cfe0eaa8cb87c8f8a43a204e",
"assets/assets/images/search.png": "d35b69d6ac840eb9451b898ba566f967",
"assets/assets/images/p3.png": "25e5012c70ad5342035dd72571ddda61",
"assets/assets/images/p2.png": "c72ac2481847f94b573abfeca984bb85",
"assets/assets/images/menu.png": "22adbf3c3a6825c85f87da187037792a",
"assets/assets/images/p1.png": "9ce826115385c629f2597267c451a1a4",
"assets/assets/images/p5.png": "be6455f346b4feceb00972cc49f21986",
"assets/assets/images/comment.png": "c9fa38a12e6effa11c18aeeb2cdeb1e4",
"assets/assets/images/p4.png": "f78928686e516911dc9634d3555272b5",
"assets/assets/images/p6.png": "21a809e79cc32fe28bb2a8c14cd532e2",
"assets/assets/images/share.png": "391d696df905341a82e4638ad8bbd5e3",
"assets/assets/images/profile.png": "ad4b7e4958393acf43c888bf2539c4b6",
"assets/assets/images/p41.png": "39482fad7dd08c996fb049a6374d6730",
"assets/assets/images/input.png": "507135bd74cc3e553184571edb2f1f21",
"assets/assets/images/b5.png": "8a51ca77560c375c391d3d510d9d0377",
"assets/assets/images/b4.png": "1e79adf44ec407ed5a3a0968459192f3",
"assets/assets/images/b6.png": "6b9bb231f7a7b941603cde088a699cfe",
"assets/assets/images/p31.png": "6e20bef6a18e8c174decc758c6d9abc0",
"assets/assets/images/b3.png": "beb834ddcac98ba7d9b2a09252a11687",
"assets/assets/images/fav.png": "f5e43ec2a11727e1fe27f9ed1ad1f30f",
"assets/assets/images/p21.png": "388392306aef8b9ce916fe34a1b7a162",
"assets/assets/images/message.png": "1393c08611196cf1fbee9b4cb03c6c0d",
"assets/assets/images/b2.png": "f7d0951397907a0ff4af11aa09203292",
"assets/assets/images/setting.png": "00507c6a31b636e3eec59224be4c3cab",
"assets/assets/images/p22.png": "c39ae70c71075b82335da21c0ddebc81",
"assets/assets/images/bg.png": "73228f96675752ef8aebbd76b5541728",
"assets/assets/images/b1.png": "6e47de135549cf8b24800eff1857c2c1",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
