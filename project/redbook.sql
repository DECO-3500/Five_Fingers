/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : redbook

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 11/10/2024 19:10:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bloger` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES ('admin', 'User1');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `img_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `red_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('admin', 'admin', 'male', 'User1', 29, '1728641884781.png', 'red1236547');

-- ----------------------------
-- Table structure for place_info
-- ----------------------------
DROP TABLE IF EXISTS `place_info`;
CREATE TABLE `place_info`  (
  `place_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `second_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of place_info
-- ----------------------------
INSERT INTO `place_info` VALUES ('Sydney Opera Hoouse', 'Opera1.png', 'Opera2.png', 'The Sydney Opera House is one of the most iconic landmarks in Australia, known for its distinctive sail-like design. Located on Bennelong Point in Sydney Harbour, it was designed by Danish architect Jørn Utzon and completed in 1973. ', 'Bennelong Point, Sydney NSW', '151.2153', '-33.8568');
INSERT INTO `place_info` VALUES ('Story Bridge', 'Bridge1.png', 'Bridge2.png', 'The Story Bridge is one of Brisbanes most iconic landmarks, connecting the northern and southern suburbs of the city. Opened in 1940, it is a heritage-listed steel cantilever bridge that spans the Brisbane River. ', 'Main St, Kangaroo Point QLD', '153.0350', '-27.4679');
-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `author_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `likes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hrf_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `focus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fans` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `collect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('author_avatars/65cec21638e35fb835886903.jpg', 'Alice', 'Exploring the Iconic Sydney Opera House! 🏛️🌊', '200', 'images/1000g00825spgo6kfk0005nooui4g8pnqvupi878!nc_n_webp_mw_1.jpg', '/explore/640bc7cd0000000013003eb4?xsec_token=ABm-g-Yrwc67ie4CzV_l7KDkeT6SzeB_AaHz92h2faigE=&xsec_source=pc_feed', '✨ Architecture & Design: The Opera House is breathtaking up close! Its unique sail-like design looks stunning against the blue waters of Sydney Harbour. Designed by Danish architect Jørn Utzon, this modern architectural masterpiece is recognized as a UNESCO World Heritage site. The structure looks different from every angle, and it’s amazing to see how the light and weather change its appearance throughout the day. 

\n☀️🌥️🎭 Cultural Hub: Not just a pretty sight — the Opera House is home to a variety of performances, including opera, theatre, ballet, and concerts. I took a guided tour, and it was fascinating to hear about the history of the building, the challenges during its construction, and the diverse events hosted here. If you love performing arts, this is a must-visit! 🎤🎻

\n🌟 Fun Fact: Did you know the Opera House is covered with over 1 million ceramic tiles? From a distance, it looks smooth and white, but up close, you can see the intricate texture and details. It’s truly a masterpiece of design and engineering.', '5', '300', '50', 1, 'NSW', 'Share tourist information');
INSERT INTO `user_info` VALUES ('author_avatars/1040g2jo30unavmmel4eg5nughsf084k525el41g.jpg', 'Bob', 'Discovering Surfers Paradise 🌊☀️', '150', 'images/1000g00826soenlsfo0005nughsf084k5bsmio68!nc_n_webp_mw_1.jpg', '/explore/6413f6f30000000011011053?xsec_token=ABexlwgDVig5VPUbqe4LaeZE1Nzg6Ba6SU0UHn0WDoBjg=&xsec_source=pc_feed', 'Just spent an amazing day at Surfers Paradise on the Gold Coast, and I’m in love with this place! 😍 The vibe here is unreal — endless golden beaches, perfect waves for surfing, and a skyline that lights up as soon as the sun goes down. 🌅🏙️

I started the day with a morning stroll along the beach, which was so peaceful before it got busy. Then I rented a surfboard and gave it a go — let’s just say I’ve got a lot to learn! 🏄‍♀️ But the water was perfect and there were surfers everywhere, making it a super fun experience.

After some surfing, I grabbed lunch at a beachfront café and enjoyed watching the beach come to life with sunbathers and beach volleyball games. Later in the day, I explored the local shops and market stalls. There’s so much happening here, from live street performers to vibrant nightlife — you could never get bored!

If you ever get the chance to visit, Surfers Paradise is a must! Can’t wait to go back and explore more of the Gold Coast. 🤩🌴 #GoldCoast #SurfersParadise #BeachLife', '8', '250', '30', 2, 'QLD', 'Beach');
INSERT INTO `user_info` VALUES ('author_avatars/1040g2jo30qg4v9m8060g4a3rlipgoedehpuolf8.jpg', 'Albert', 'Discovering the Majestic Twelve Apostles on the Great Ocean Road 🌊🗺️', '6666', 'images/1000g00826uss1nsfu0404a3rlipgoedeqerdoqo!nc_n_webp_mw_1.jpg', '/explore/64149015000000001300c3e3?xsec_token=ABL8Sx0pehZ3W44CzIwgbLdV_xShgXCJip17RJcsTnQ4U=&xsec_source=pc_feed', ' 📍 How to Get There:
The Twelve Apostles is just a 3-hour scenic drive from Melbourne, making it an ideal road trip for nature lovers. The journey offers stunning coastal views, with plenty of photo-worthy stops along the way.

🕒 Best Time to Visit:
For the most breathtaking experience, visit the Twelve Apostles at sunrise or sunset. The golden light of the sun beautifully illuminates the towering limestone stacks, creating a magical glow.

📸 Photo Tips:
Bring along a wide-angle lens to capture the panoramic beauty of this iconic site. The views from the main lookout and the Gibson Steps offer different perspectives, so don’t miss out on exploring both.

🥾 Explore More:
While the Twelve Apostles are the star attraction, nearby gems like Loch Ard Gorge and London Bridge are equally worth visiting. These natural wonders provide even more opportunities to marvel at the rugged beauty of Australia’s coastline.', '180', '7', '400', 80, 'VIC', 'VIC');
INSERT INTO `user_info` VALUES ('author_avatars/1040g2jo30o99j8v8ie005nlssg6gbh9l91e1qqo.jpg', 'Mei', 'A Day at Darling Harbour 🌆🌊', '120', 'images/1000g00823gl94emfo0705nlssg6gbh9l2542vl0!nc_n_webp_mw_1.jpg', '/explore/63f84a5b000000001203f5e2?xsec_token=ABSB3CwD6JsuV41-cHhzGfkl28yAP2IOvqc4lkAA845Yg=&xsec_source=pc_feed', 'Just spent an amazing day exploring Darling Harbour, and I’m already planning my next visit! 🤩 This place has it all — beautiful waterfront views, fun attractions, and so many great spots to eat and relax.

I started my day with a walk along the harbour, soaking up the sunshine and watching the boats go by. The atmosphere is so lively, with families, tourists, and locals all enjoying the day. 🌞 After that, I checked out the SEA LIFE Sydney Aquarium, and wow, the marine life here is incredible! 🐠🦈 You can literally walk through a glass tunnel surrounded by sharks and stingrays — definitely a highlight.

For lunch, I stopped at one of the many restaurants with outdoor seating, overlooking the water. Such a perfect spot to chill and watch the world go by. Then I spent the afternoon wandering through the Chinese Garden of Friendship, which is like a little peaceful oasis right in the middle of the city. 🌸🏯
', '6', '180', '20', 4, 'NSW', '#Share');
INSERT INTO `user_info` VALUES ('author_avatars/614454911efd2bdc0250058a.jpg', 'Jack♥', 'Breathtaking Blue Mountains Adventure 🌄🌿', '100', 'images/1000g00825t76ljifo0005noiichgbqn0mmtd0s8!nc_n_webp_mw_1.jpg', '/explore/640be3e10000000027002afe?xsec_token=ABm-g-Yrwc67ie4CzV_l7KDtPHPLbex73vBQj8uFNdExc=&xsec_source=pc_feed', 'Just got back from an unforgettable day trip to the Blue Mountains, and I’m absolutely blown away by the beauty of this place! 😍🌳 If you love nature, hiking, and stunning views, this is the perfect escape from the city.

We started our journey with a scenic drive from Sydney, and the moment we reached the mountains, the air felt fresher and the landscape more magical. Our first stop was at Echo Point to see the famous Three Sisters rock formation — the view from there was absolutely breathtaking! 🏞️ The blue haze over the mountains is something you have to see to believe.

After taking in the views, we hiked down into the lush rainforest below, where we were surrounded by towering trees, waterfalls, and the sounds of nature. The trails are well-marked and range from easy to challenging, so there’s something for everyone. We even took a ride on the Scenic Railway — the steepest passenger railway in the world! 🚂 Such a fun and th

By the end of the day, we were tired but so refreshed by all the natural beauty. The Blue Mountains are a must-see if you’re visiting Sydney — it’s the perfect blend of adventure and tranquility. Can’t wait to come back and explore more! 🌿🌞 #BlueMountains #NatureLovers #SydneyDayTrips', '5', '150', '25', 5, 'NSW', 'Bluemoutain');
INSERT INTO `user_info` VALUES ('author_avatars/1040g2jo310713vf5m41044ludo33rp04mi49h08.jpg', 'Simon）', 'Unexpected Aurora in Byron Bay! 🌌✨', '110', 'images/1000g00826fa7fuqfi00044ludo33rp04cgc0kj8!nc_n_webp_mw_1.jpg', '/explore/6410891b00000000130049af?xsec_token=ABa0s2IzqgiF-vHnvBvDpJlztJuzAXdEpCzaCpl7nO_eo=&xsec_source=pc_feed', 'I still can’t believe what I saw last night in Byron Bay — the Aurora Australis!! 😱💚 I’ve heard of it happening occasionally in Australia, but I never thought I’d be lucky enough to see it with my own eyes, especially here in Byron!

It started as a quiet night on the beach, just stargazing and listening to the waves. Then, out of nowhere, the sky started to glow with these incredible green and pink hues. It felt so surreal, like something out of a dream! The lights danced across the sky, reflecting off the water and creating the most magical atmosphere. 🌊✨

I’ve been to Byron Bay a few times, but this was by far the most unforgettable experience. It’s such a peaceful and beautiful place on its own, but to witness the southern lights here? Absolutely mind-blowing! If you’re ever visiting during a solar storm, keep an eye on the sky — you never know what you might see. 🌌💫 #AuroraAustralis #ByronBayMagic #OnceInALifetime💖。', '9', '300', '15', 6, 'NSW', 'Beachtower');
INSERT INTO `user_info` VALUES ('author_avatars/1040g2jo3109a5bqtmo0g5og958440o47h84fkso.jpg', 'HoneyBoy53', 'Exploring Kangaroo Island 🦘🌿', '90', 'images/1000g00826io6brkfe0005og958440o47hjbn6b8!nc_n_webp_mw_1.jpg', '/explore/641166db0000000027010d75?xsec_token=AB2Q-dTOAsHO0W2WkGTqlx4SLdF5dURcOLn8pj7s1QjaU=&xsec_source=pc_feed', '
Just wrapped up an incredible few days on Kangaroo Island, and I can’t recommend this place enough for nature lovers and adventure seekers! 🌊🌳 This island is like a wildlife paradise — everywhere you turn, there’s something amazing to see.

We started our trip with a visit to Flinders Chase National Park, where we saw the famous Remarkable Rocks and Admirals Arch. The views of the rugged coastline were stunning, and we even spotted some seals lounging on the rocks below! 🦭 The natural beauty here is seriously next level.

Of course, one of the best parts was spotting kangaroos and koalas in the wild! 🦘🐨 Kangaroo Island lives up to its name — we saw kangaroos hopping around in the open fields and koalas hanging out in the eucalyptus trees. We also got to visit a wildlife sanctuary where we learned about conservation efforts to protect these beautiful animals.

The beaches here are some of the most pristine I’ve ever seen. We spent time relaxing on Vivonne Bay, which has the softest sand and crystal-clear water. Perfect for a peaceful swim and soaking up the sunshine. ☀️🏖️

If you’re looking for a destination that combines wildlife, nature, and adventure, Kangaroo Island is a must-visit. It’s a true escape from the hustle and bustle, and I’m already planning my next trip back! 🏝️✨ #KangarooIsland #WildlifeAdventures #AustraliaTravel', '6', '130', '10', 7, 'SA', 'Goodview');
INSERT INTO `user_info` VALUES ('author_avatars/6155a73515d8ec6545af2ad9.jpg', 'Wang', 'Sunny Days at Bondi Beach 🌊☀️', '110', 'images/1000g008277jds9mfe00049ul1ga8eas7jk1aul0!nc_n_webp_mw_1.jpg', '/explore/6416bd650000000013006a51?xsec_token=ABTwEGdn4Xvz9C8HtVFsRRe0V_IXDf_jhp-0MPim3w7v0=&xsec_source=pc_feed', 'Just spent an amazing day at Bondi Beach, and it’s everything I dreamed it would be! 😍 Whether you’re here to surf, swim, or just relax, Bondi has something for everyone. The beach itself is stunning — soft white sand, crystal-clear water, and the iconic rolling waves that make it a surfer’s paradise. 🏄‍♂️🌊

I started the morning with a swim in the Bondi Icebergs ocean pool — the views from there are unreal! It’s the perfect spot to swim if you want a break from the waves, and the backdrop of the beach is breathtaking. After that, I grabbed a coffee from one of the many cool beachside cafés and just watched the surfers catching waves. ☕🌴

The famous Bondi to Coogee coastal walk was next on my list, and it did not disappoint! The path hugs the coastline, offering spectacular views of the ocean, dramatic cliffs, and hidden coves along the way. It’s a great way to see more of Sydney’s beautiful coast and get some exercise at the same time! 🥾🌅

By the afternoon, Bondi was buzzing with energy — sunbathers, families, locals, and tourists all enjoying the sunshine. I wrapped up the day with some fish and chips on the beach while watching the sunset. Honestly, it’s the perfect way to experience the Aussie beach lifestyle. 😎🍴', '7', '220', '12', 8, 'NSW', 'Beach view');
INSERT INTO `user_info` VALUES ('author_avatars/1040g2jo3180edrmpju0g45t390inm8q9m4td8rg.jpg', 'Rog', 'Mesmerized by Uluru 🌅🧡', '120', 'images/1000g0082717jpeofk00045t390inm8q9m4im0ro!nc_n_webp_mw_1.jpg', '/explore/64151bf30000000013003a8b?xsec_token=ABFLoxizbGPC6eKVRu-22uYA7RIdLwcJ5GPmj-7EtCOKI=&xsec_source=pc_feed', 'I’ve just had the most incredible experience visiting Uluru (Ayers Rock), and it’s truly one of the most awe-inspiring places I’ve ever seen! 😍 This massive, red sandstone monolith rising out of the desert is nothing short of magical — it’s easy to see why it’s such a sacred site for the local Anangu people.

We arrived just in time for sunset, and watching Uluru change colors as the sun dipped below the horizon was breathtaking. From deep red to fiery orange, it felt like the rock was alive! 🌄🔥 I couldn’t take my eyes off it. If you’re visiting, I highly recommend doing both a sunrise and sunset viewing — both are unforgettable in their own way.

The next day, we did the base walk around Uluru, which gave us a closer look at the stunning rock formations, ancient caves, and Aboriginal rock art that tells stories of the land. 🖼️ It’s so peaceful walking through the desert, surrounded by the vast open space and the incredible natural beauty of the Outback. We also learned a lot about the cultural significance of Uluru and its importance to the Aboriginal people, which made the visit even more special.

This place is more than just a tourist spot — it’s a deeply spiritual and powerful experience. If you ever get the chance to visit, don’t miss it! Uluru is unlike anywhere else on Earth. 🧡✨ #Uluru #AyersRock #OutbackAdventures #CulturalHeritage', '6', '200', '18', 9, 'NT', 'Nature view');
INSERT INTO `user_info` VALUES ('author_avatars/1040g2jo30u6mph055i004a2sqrreqovf2c91vl8.jpg', 'kEVIN886', 'Diving into the Great Barrier Reef 🐠🌊', '130', 'images/1000g00825p5g9psfm0004a2sqrreqovf7e8bdp8!nc_n_webp_mw_1.jpg', '/explore/640ada8d0000000013002599?xsec_token=ABzkkjS6ea7QcNCJWRFC92CBGT9Sa_Bhy4w_yPP9-i2N4=&xsec_source=pc_feed', 'Just had the most incredible adventure exploring the Great Barrier Reef, and words can’t do justice to how stunning it is! 😍🌴 This natural wonder is like an underwater paradise, full of vibrant coral, colorful fish, and marine life I’ve only ever seen in documentaries.

We took a boat tour out to one of the reef’s outer edges, and as soon as I jumped into the water, I was surrounded by schools of fish and beautiful coral gardens. 🐠🐡 Snorkeling here is an experience of a lifetime — the water is so clear, and the reef is bursting with life. We saw everything from clownfish (just like Nemo!) to giant clams, and even a sea turtle that swam right by us. 🐢 It felt like swimming through a dream!

If you’re a diver, this is paradise — the reef is full of dive sites for all experience levels. But even if you’re just snorkeling, like me, you’ll be amazed by how much you can see right ne

The day ended with a gorgeous sunset as we cruised back to shore, and I couldn’t help but feel grateful for witnessing one of the world’s greatest natural wonders. 🌅 It’s not just the beauty of the reef, but also the sense of calm and connection

If you’re ever in Australia, the Great Barrier Reef is an absolute must-see! It’s a reminder of how beautiful and fragile our planet is, and I hope we can all help protect it for future generations. 🌊🐠💙 #GreatBarrierReef #UnderwaterAdventure #NaturalWonder #ProtectOurOce', '7', '350', '30', 10, 'QLD', 'Beach');
INSERT INTO `user_info` VALUES ('author_avatars/1040g2jo30rgdc2jlhg0048ormocigph4f57lshg.jpg', 'Anugs66', 'Adventure at Mitchell Falls 🏞️💧', '110', 'images/1000g00826a74jnqfe05g48ormocigph42e29op8!nc_n_webp_mw_1.jpg', '/explore/640f37a900000000270104e7?xsec_token=ABEAaJ-Go6VwL3SUuy_mhpip7e1UIey2bOXCM1pGEdd5M=&xsec_source=pc_feed', 'Adventure at Mitchell Falls 🏞️💧

Just came back from an epic trip to Mitchell Falls in the Kimberley region, and it was hands down one of the most incredible places I’ve ever visited! 😍🌿 If you’re looking for a true Aussie outback adventure, this is it.

The journey to Mitchell Falls isn’t easy — a rugged 4WD trip and a hike through the remote wilderness, but trust me, it’s totally worth it. As soon as we reached the falls, the view took my breath away. The waterfalls cascade down four tiers into crystal-clear pools, surrounded by ancient rock formations and lush greenery. The sight is absolutely majestic! 🏞️💦

We hiked to the top of the falls and took in the panoramic views of the surrounding Kimberley landscape. After that, we couldn’t resist taking a refreshing dip in the natural pools at the base of the falls. Swimming in the cool water with the sound of the falls behind us was a dream come true. 🏊‍♂️✨

For the thrill-seekers, you can also take a scenic helicopter flight to see the falls from above, giving you a whole new perspective of this remote wilderness. 🚁 The vastness of the Kimberley is truly humbling — it feels like a land untouched by time.

Mitchell Falls is a must-visit for anyone who loves nature, adventure, and Australia’s rugged beauty. It’s an experience I’ll never forget! 🌿🌟 #MitchellFalls #KimberleyAdventure #AustraliaOutback #Water', '6', '250', '22', 11, 'WA', 'NatureFalls');
INSERT INTO `user_info` VALUES ('author_avatars/63f072d09ffb98befcb3d990.jpg', 'Foodie6', 'Best Steak at the Norman Hotel! 🥩🍽️', '90', 'images/1000g008268qceq4fm0005ngilf30880ph5jjnco!nc_n_webp_mw_1.jpg', '/explore/640edbfc000000000800c4be?xsec_token=ABLtWiovbJcSViHuvtq6syo_x3GyP2dmQWfDNL-pJQyIk=&xsec_source=pc_feed', 'Just had the most amazing steak dinner at the Norman Hotel in Brisbane, and I’m still dreaming about it! 😋 If you’re a steak lover like me, this place is a must-visit. Known as the “Brisbane’s Worst Vegetarian Restaurant” (😂), it’s famous for serving up some of the best steaks in town, and I can confirm — they did not disappoint!

As soon as you walk in, you can smell the smoky goodness from the grill. I ordered the classic rib-eye, cooked medium rare, and it was absolute perfection. The steak was juicy, tender, and packed with flavor. They have a great selection of sauces too, but honestly, the meat was so good it didn’t even need it! 🥩🔥

The atmosphere at Norman Hotel is super relaxed and laid-back, perfect for a casual night out with friends or family. The staff were friendly, and the service was quick despite how busy it was. We also ordered some delicious sides — crispy fries, a fresh garden salad, and their famous garlic bread. 🍞🍟 Everything was spot on.

If you’re in Brisbane and craving a top-notch steak, the Norman Hotel should be at the top of your list. I’ll definitely be back for another round! 🤤🥂 #NormanHotel #BrisbaneEats #SteakLovers #FoodieAdventures。', '5', '100', '5', 12, 'QLD', 'Best steaks');

SET FOREIGN_KEY_CHECKS = 1;
