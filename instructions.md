# Super Star Trek

## Instructions

1. When you see `Command ?` printed, enter one of the legal commands ([NAV](#nav), [SRS](#srs), [LRS](#lrs), [PHA](#pha), [TOR](#tor), [SHE](#she), [DAM](#dam), [COM](#com), or [XXX](#xxx)).
2. If you should type in an illegal command, you'll get a short list of the legal commands printed out.
3. Some commands require you to enter data (for example, the [NAV](#nav) command comes back with `Course (1-9) ?`.)  If you type in illegal data (like negative numbers), than command will be aborted.

The galaxy is divided into an 8 x 8 quadrant grid, and each quadrant is further divided into an 8 x 8 sector grid.

You will be assigned a starting point somewhere in the galaxy to begin a tour of duty as commander of the starship **Enterprise**; your mission: to seek and destroy the fleet of Klingon warships which are menacing the United Federation of Planets.

You have the following commands available to you as captain of the starship Enterprise:

---

### NAV

Warp Engine Control

Course is in a circular numerical vector arrangement as shown integer and real values may be used.  (Thus course 1.5 is halfway between 1 and 2)

![Course](compass.svg)

Values may approach 9.0, which itself is equivalent to 1.0

One warp factor is the size of one quadrant.  Therefore, to get from quadrant 6,5 to 5,5, you would use course 3, warp factor 1.

<!-- Add example screen here -->

---

### SRS

Short Range Sensor Scan

Shows you a scan of your present quadrant.

Symbology on your sensor screen is as follows:

``` text
symbol description                                      
  <*>  our starship's position                          
  +K+  Klingon battle cruiser                           
  >!<  Federation starbase (refuel/repair/re-arm here!) 
   *   Star                                             
```

A condensed 'status report' will also be presented.

<!-- Add example screen here -->

---

### LRS

Long Range Sensor scan

Shows conditions in space for one quadrant on each side of the Enterprise (which is in the middle of the scan) The scan is coded in the form `###`, where the units digit is the number of stars, the tens digit is the number of starbases, and the hundreds digit is the number of Klingons.

Example - `207` = 2 Klingons, no starbases, and 7 stars.

<!-- Add example screen here -->

---

### PHA

Phaser Control

Allows you to destroy the Klingon battle cruisers by zapping them with suitably large units of energy to deplete their shield power.  (Remember, Klingons have phasers too!)

<!-- Add example screen here -->

---

### TOR

Photon Torpedo Control

Torpedo course is the same as used in warp engine control If you hit the Klingon vessel, he is destroyed and cannot fire back at you.  If you miss, you are subject to his phaser fire.  In either case, you are also subject to the phaser fire of all other Klingons in the quadrant.

The library-computer ([COM](#com) command) has an option to compute torpedo trajectory for you (option 2)

---

### SHE

Shield Control

Defines the number of energy units to be assigned to the shields.  Energy is taken from total ship's energy.  Note than the status display total energy includes shield energy

<!-- Add example screen here -->

---

### DAM

Damage Control Report

Gives the state of repair of all devices.  Where a negative 'state of repair' shows that the device is temporarily damaged.

<!-- Add example screen here -->

---

### COM

Library Computer

The library-computer contains six options:

| Option | Command                       | Description                                                                                        |
|-------:|:------------------------------|:---------------------------------------------------------------------------------------------------|
| 0      | Cumulative galactic record    | This option shows computer memory of the results of all previous short and long range sensor scans |
| 1      | Status report                 | This option shows the number of Klingons, stardates, and starbases remaining in the game.          |
| 2      | Photon torpedo data           | Which gives directions and distance from the Enterprise to all Klingons in your quadrant           |
| 3      | Starbase nav data             | This option gives direction and distance to any starbase within your quadrant                      |
| 4      | Direction/distance calculator | This option allows you to enter coordinates for direction/distance calculations                    |
| 5      | Galactic / region name / map  | This option prints the names of the sixteen major galactic regions referred to in the game.        |

---

### XXX

Exit game

Print out final status and quit the game

---

### Fine print

Klingon, Enterprise and Star Trek are among the trademarks of the Paramount Corporation. Many games written before and at the beginning of the personal computer era, like this one, used copyrighted material and intellectual property without permission. These trademarks are retained for historical accuracy.
