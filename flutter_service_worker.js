'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"index.html": "34c6831dcaa0d1942f87e4a88da3ed63",
"/": "34c6831dcaa0d1942f87e4a88da3ed63",
"main.dart.js": "c2251a41c9c02249447af8177080f775",
"manifest.json": "7709e89ae43114a3a24ebf5372abcd6b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "f32f85df26236e9adeeb6ba362e13384",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/shaders/ink_sparkle.frag": "6333b551ea27fd9d8e1271e92def26a9",
"assets/assets/wallpapers/wallpaper-1.jpg": "f92374bc6577d3596c6044b49a28f429",
"assets/assets/weathers/cloudy.png": "be45675469a95f39c07616bd188aa185",
"assets/assets/images/chat-message-blue-speech-bubble-icon-with-bell-notification-alert-notice-reminder-symbol-conversation-button-icon-symbol-background-3d-illustration.jpg": "b3dc2dff29b01f813c4d94893dffabb0",
"assets/assets/images/mail-illustration.jpg": "b3dc2dff29b01f813c4d94893dffabb0",
"assets/assets/images/love.png": "5fe247bdc45c273632446288f77927cc",
"assets/assets/images/play.png": "44a0a406f25f7cedbeb57ab79db7c7f1",
"assets/assets/ios_icons/recorder.png": "d79091b3e0bc472160c69722953d31bf",
"assets/assets/ios_icons/clock.png": "96f5c5f510761bdf0ba92548c5ad79fc",
"assets/assets/ios_icons/phone.png": "4ebdc3d3a67095fcc0b339202c2bcbff",
"assets/assets/ios_icons/calculator.png": "93dc10dddf5b1c50e9408c17a4bdb504",
"assets/assets/ios_icons/app-books.png": "a87670f5d46219f6cd1d1b08b6702ce6",
"assets/assets/ios_icons/safari.png": "d3b6f04fb75612ffdf0cfcf98a00e5b5",
"assets/assets/ios_icons/connect.png": "a7156d843dc598f58cb59c0ba8797675",
"assets/assets/ios_icons/camera.png": "3a8b9c04e328c6e9c9abd8d86b7a5e14",
"assets/assets/ios_icons/whatsapp.png": "5859fd8b888de2b526879539b407fb40",
"assets/assets/ios_icons/twitter.png": "1135b0180bffc44492b4578111ebc616",
"assets/assets/ios_icons/settings.png": "6ca071088d45d9934476f985fb933d1e",
"assets/assets/ios_icons/mail.png": "fc833628599fc0af62b0d6ebb1df2a9a",
"assets/assets/ios_icons/calender.png": "c8194d3a6d75f3745e26fe5420405f2d",
"assets/assets/ios_icons/calendar.png": "1d505e1d3a0b506fdde2746f1a8943f5",
"assets/assets/ios_icons/weather.png": "d5fedf31a295ff7bcf8787c1044d4616",
"assets/assets/ios_icons/photos.png": "941ee0d3f755697f5729ee7b52efd74c",
"assets/assets/ios_icons/linkedin.png": "daa54a586de4bc3864f40e841900d2e7",
"assets/assets/ios_icons/app-store.png": "c32075b9e0b09f8e96ff30a475f29f2b",
"assets/assets/glyph_icons/cellular.svg": "a58d37f93c2e94d70339c65538dd863f",
"assets/assets/glyph_icons/battery-charging.svg": "51304b3aa79c1ea91272f3e64ca6ca94",
"assets/assets/glyph_icons/wifi.svg": "01b35f1d11bc60ef07abed103b2368a1",
"assets/assets/glyph_icons/spotify.svg": "ce82d898d52327efc1943184965d97c5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "3d4f397c255e133e546da745e121f50d",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"version.json": "009c9e65172e010890f7f65fde438006"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
