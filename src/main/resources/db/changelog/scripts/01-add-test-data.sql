INSERT INTO book ( title, author, difficulty, genre)
VALUES ( 'Pirates of the Jade Sea', 'Marina Blackwood', 'MEDIUM', 'Fantasy');

INSERT INTO consequence ( type, value, text)
VALUES ( 'LOSE_HEALTH', 3, 'The pirate lunges at you with a hidden dagger before the guards subdue him.'),
       ( 'LOSE_HEALTH', 5, 'A rogue wave crashes onto the deck, injuring several crew members.'),
       ( 'LOSE_HEALTH', 7, 'A swirling current drags you under before the crew hauls you back aboard.'),
       ( 'LOSE_HEALTH', 4, 'Splinters cut your hands as you force the chest open.'),
       ( 'LOSE_HEALTH', 6, 'A rock grazes your shoulder as you narrowly escape.');

INSERT INTO section (id, story_id, text, type)
VALUES (1, 1,
        'The salty breeze carries the cries of distant gulls as your ship sails across the shimmering Jade Sea. Rumors speak of hidden treasure on the Isle of Serpents.',
        'BEGIN'),
       (20, 1, 'The captured pirate snarls but whispers about a secret cove guarded by a sea monster.', 'NODE'),
       (100, 1, 'You steer toward the mysterious Isle of Serpents. As you approach, dark storm clouds gather overhead.',
        'NODE'),
       (200, 1,
        'Shaken, the pirate reveals that the sea monster can be lulled to sleep by an enchanted conch shell hidden deep within a wrecked galleon.',
        'NODE'),
       (300, 1, 'The storm rages violently. Lightning flashes illuminate shadowy shapes beneath the waves.', 'NODE'),
       (400, 1, 'After hours of waiting, the storm clears and the Isle of Serpents looms ahead, shrouded in mist.',
        'NODE'),
       (500, 1,
        'You find the wrecked galleon resting on a coral reef. The conch shell glows faintly within a locked chest.',
        'NODE'),
       (600, 1, 'Beneath the waves, you glimpse the massive serpent coiled around a treasure-laden wreck.', 'NODE'),
       (700, 1, 'The storm subsides. Your ship drifts into calm waters, and the sun breaks through the clouds.',
        'NODE'),
       (800, 1, 'You step onto the white sands of the Isle of Serpents. Ancient ruins rise above the jungle canopy.',
        'NODE'),
       (900, 1, 'Inside the chest, you find the enchanted conch shell. Its surface hums softly with power.', 'NODE'),
       (1000, 1, 'The chest bursts open, revealing the glowing conch shell.', 'NODE'),
       (1200, 1, 'Inside the ruins, you discover a chamber filled with gold and jewels, but a trap triggers!', 'NODE'),
       (1300, 1, 'From the top of the ruins, you spot a hidden lagoon surrounded by jagged cliffs.', 'NODE'),
       (1400, 1, 'You reach a secret pirate hideout filled with treasure. The crew celebrates your discovery.', 'END'),
       (1500, 1, 'Breathing heavily, you escape the collapsing ruins with your life intact.', 'END'),
       (666, 1, 'An unreachable whirlpool drags you into darkness. You should not be here.', 'NODE');

INSERT INTO story_option (section_id, description, goto_id, consequence_id)
VALUES (1, 'Take the helm and steer toward the Isle of Serpents', 666, NULL),
       (1, 'Interrogate the captured pirate in the brig', 999, NULL),

       (20, 'Threaten him for more information', 200, 1),
       (20, 'Leave him and return to the deck', 1, NULL),

       (100, 'Sail through the storm', 300, NULL),
       (100, 'Drop anchor and wait for the storm to pass', 400, 2),

       (200, 'Search for the wrecked galleon', 500, NULL),
       (200, 'Ignore the legend and continue to the island', 100, NULL),

       (300, 'Dive into the water to investigate', 600, 3),
       ( 300, 'Stay on deck and brace for impact', 700, NULL),

       ( 400, 'Explore the island', 800, NULL),

       ( 500, 'Unlock the chest carefully', 900, NULL),
       ( 500, 'Smash the chest open', 1000, 4),

       ( 600, 'Swim closer to investigate', 666, NULL),
       ( 600, 'Retreat back to the surface', 300, NULL),

       ( 700, 'Set a course for the Isle of Serpents', 800, NULL),

       ( 800, 'Search the ruins for treasure', 1200, NULL),
       ( 800, 'Climb the tallest ruin for a better view', 1300, NULL),

       ( 900, 'Blow the conch to summon help', 1400, NULL),
       ( 900, 'Keep it safe for later', 800, NULL),

       ( 1000, 'Take the shell', 900, NULL),

       ( 1200, 'Dodge the falling stones', 1500, 5),
       ( 1200, 'Grab the treasure and run', 1400, NULL),

       ( 1300, 'Head toward the hidden lagoon', 1400, NULL);

--ROLLBACK
--DELETE FROM story_option WHERE section_id IN (1, 20, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1200, 1300, 1400, 1500, 666);
--DELETE FROM section WHERE story_id = 1;
--DELETE FROM consequence WHERE id IN (1, 2, 3, 4, 5);
--DELETE FROM story WHERE id = 1;