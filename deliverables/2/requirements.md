1. The program shall be run by typing `ruby gold_rush.rb` at the command line along with two arguments, the `seed` and the `number of prospectors`.  Both shall be integers.  If there are not two arguments, the arguments cannot be interpreted as integers, or the number of prospectors is not a positive integer, the system shall report usage and exit with exit code 1.

2. The program shall create all pseudorandom numbers from the seed passed in as an integer argument to the program (as explained in requirement 1).  Thus, the system is repeatable with the same arguments.

3. The seven locations on the map shall be as follows: Sutter Creek, which connects to Coloma and Angels Camp; Coloma, which connects to Sutter Creek and Virginia City; Angels Camp, which connects to Nevada City, Sutter Creek, and Virginia City; Nevada City, which connects to Angels Camp; Virginia City, which connects to Angels Camp, Coloma, Midas, and El Dorado Canyon; Midas, which connects to Virginia City and El Dorado Canyon; and El Dorado Canyon, which connects to Virginia City and Midas.  It may be easier to view a graphical depiction of the map:
```
Nevada City
     \
      \
     Angels Camp
       |     \            /---------- Midas
       |     Virginia City              |
       |            |    \              |
       |            |     \---------- El Dorado Canyon
       |            |
       |            |
Sutter Creek ---- Coloma
```

4. A prospector shall always start in Sutter Creek.

5. At each location, a prospector shall search for gold and silver.

6. During the first three locations a prospector searches, they shall leave a location if they find no silver and no gold.  If they find any silver or gold, they will stay at the location for another iteration.

7. During the final two locations a prospector searches, they shall leave a location if they find one ounce or fewer of gold and two ounces or fewer of silver.  If they find either two ounces or more of gold, or three ounces or more of silver, they will remain.

8. When a prospector leaves a location, they will travel to one of the connected locations for that location, chosen pseudorandomly.  For example, El Dorado Canyon is connected to Midas and Virginia City, so a prospector leaving El Dorado shall always head to one of those two locations.

9. A prospector shall prospect until they have visited five locations.  This may include "repeats" - for example, a prospector who went to Sutter Mill, Coloma, Virginia City, Coloma, Sutter Mill has visited five locations, even though they visited only three unique locations.

10. Prospectors shall find the following amounts of gold and silver at each iteration at each location.  Note that the numbers indicated are a maximum.  Prospectors shall find between 0 and the maximum number of ounces shown per iteration.
```
Location     | Max Silver | Max Gold
------------------------------------
Sutter Creek |    0       |    2
Coloma       |    0       |    3
Angels Camp  |    0       |    4
Nevada City  |    0       |    5
Virginia City|    3       |    3
Midas        |    5       |    0
El Dorado Cn |   10       |    0
------------------------------------
```

11. At each iteration, the simulation shall display how many ounces of gold and/or silver were discovered.  If neither was discovered, the system shall state that no precious metals were found.  If only one was discovered, the system shall only print the number of ounces found of that metal (in other words, the system shall never display that 0 ounces of a metal were found).

12. When heading to a new location, the simulator shall display the new location, along with the amount of gold and silver they are holding.

13. The prospector's location information shall be printed out without a leading tab; iformation on precious metals found and cost shall be indented by one tab.

14. After a prospector has visited five locations and thus finished prospecting, the number of ounces of gold and silver the prospector has discovered shall be displayed.

15. After the the number of ounces of gold and silver has been displayed, the total amount of money's worth of precious metals (the sum of both silver and gold) shall be displayed.  This shall be calculated at the prevailing 1849 rate of $20.67 per ounce of gold and $1.31 per ounce of silver.

16. When displaying monetary values, they shall be displayed according to the nearest cent (1 / 100th of a dollar) and two values shall always be placed to the right of the decimal point.  Additionally, it shall always be prefaced by the dollar symbol $. For example, print "$1.00" instead of "1.0" or "$1", "$2.50" instead of "$2.5", etc.

17. When displaying information, the correct singular and plural forms shall be used, e.g. "0 ounces", "1 ounce", "2 ounces".

18. The simulation shall run the number of times indicated by the second argument to the program.  Prospectors shall be named "Prospector #n" where n is their number, starting with 1 (there shall be no Prospector #0).

19. Output shall be as close as possible to that displayed in the `sample_output.txt` file in this directory.  This file shall be used to resolve any ambiguities in these requirements.