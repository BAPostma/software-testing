module Lab6

where
import Data.List
import System.Random
import Week6
import Control.Monad

carmichael :: [Integer]
carmichael = [ (6*k+1)*(12*k+1)*(18*k+1) | 
      k <- [2..], 
      isPrime (6*k+1), 
      isPrime (12*k+1), 
      isPrime (18*k+1) ]

-- Exercise 1: is already given in Week6.hs

-- Exercise 2:
{-
 For realistic tests we compute if a number is prime by Fermat's Test

 Fermat's Test tests if n is prime
 - we pick an a with 1 < a < n
 - we comput exM a (n-1) n (and same for expM)

 Test 1: a = 4, n = m2
  expM 4 (m2-1) m2
  1
  (0.00 secs, 1580936 bytes)
  exM 4 (m2-1) m2
  1
  (0.00 secs, 1583136 bytes)

 Test 2: a = 123456, n = m6
  expM 123456 (m6-1) m6
  1
  (0.06 secs, 14780448 bytes)
  exM 123456 (m6-1) m6
  1
  (0.00 secs, 1584048 bytes)

 - Test 3: a = 123456, n = m8
  expM 123456 (m8-1) m8 
  (ran more than 10 minutes)
  exM 123456 (m8-1) m8
  1
  (0.00 secs, 1029544 bytes)
-}

-- Exercise 3:
composites :: [Integer]
composites = differenceSorted [2..] primes

-- Precondition: both lists are sorted
-- Postcondition: the difference between the two lists
differenceSorted :: [Integer] -> [Integer] -> [Integer]
differenceSorted (x:xs) (y:ys) | x < y = x : differenceSorted xs (y:ys)
                               | otherwise = differenceSorted xs ys

-- This function is implemented according the hints in the assignment, but the function above is much faster
composites1 :: [Integer]
composites1 = [x | (x,False) <- sieveComposites [(i,True) | i <- [2..]]]

sieveComposites :: [(Integer,Bool)] -> [(Integer,Bool)]
sieveComposites ((i,False):ibs) = (i,False) : sieveComposites ibs
sieveComposites ((i,True):ibs) = (i,True) : sieveComposites (map (\ (n,b) -> (n, b && rem n i /= 0)) ibs)

-- Exercise 4:
-- 'k' is the number of times the Fermat prime check is conducted, so increasing k results in a more reliable check
-- The least numbers that fool the check are:
-- - testF 1 composites -> 4
-- - testF 2 composites -> 21
-- - testF 3 composites -> 85
-- - testF 4 composites -> 481
-- - testF 5 composites -> 561
-- - testF 10 composites -> 1105
-- - testF 15 composites -> 46657
-- - testF 20 composites -> no number that fooled the check was found after running for 5 minutes

-- Takes an Int which indicates how many times the Fermat prime check is conducted and a list of integers to test for primality
testF :: Int -> [Integer] -> IO ()
testF k (p:ps) = do
  r <- primeF k p
  when (r) $ print("Number: " ++ show p ++ ", Fermat's check: " ++ show r)
  testF k ps

-- Exercise 5:
-- Results of testing:
{-
testF 1 carmichael -> seems to return all CarMicheal numbers
testF 2 carmichael -> seems to return all CarMicheal numbers
testF 5 carmichael -> does not return the first CarMicheal number (294409) as a number that fools Fermat's little theory
-}
-- So if 'k' gets higher, not all CarMicheal numbers are returned as numbers that fool Fermat's little theory. This is because
-- Fermat's little theory states that prime numbers have the property a^p = a (mod p). CarMicheal numbers have the property
-- a^p = a (mod p) too, however 'a' and 'p' have to be relatively prime (i.e. gcd has to be 1). So if we find an 'a' that is
-- not relatively prime with 'p', is does not pass Fermat's prime check. The higher 'k' gets, the higher the probability we
-- find such an 'a'.

-- Exercise 6:
-- Takes an Int which indicates how many times the Miller-Rabin primality check is conducted and a list of integers to test for primality
testMR :: Int -> [Integer] -> IO ()
testMR k (p:ps) = do
  r <- primeMR k p
  when (r) $ print("Number: " ++ show p ++ ", Miller-Rabin's check: " ++ show r)
  testMR k ps

-- Findings:
{-
testMR 1 carmichael
"Number: 100264053529, Miller-Rabin's check: True"
"Number: 3296857440241, Miller-Rabin's check: True"
"Number: 3878725359169, Miller-Rabin's check: True"
"Number: 15181505298649, Miller-Rabin's check: True"
"Number: 24977268314209, Miller-Rabin's check: True"
"Number: 35700127755121, Miller-Rabin's check: True"
(and many more)

testMR 2 carmichael
"Number: 11413778221441, Miller-Rabin's check: True"
"Number: 177548395641481, Miller-Rabin's check: True"
"Number: 2057172011015041, Miller-Rabin's check: True"
"Number: 438857911794266929, Miller-Rabin's check: True"
"Number: 445578582952541881, Miller-Rabin's check: True"
(and many more)

testMR 5 carmichael -> did't found any number that fooled the MR test after running for 2 minutes
-}
-- Conclusion: much less CarMicheal numbers fool the Miller-Rabin test.

-- Exercise 7:
-- Precondition: input is a prime number
mersennePrimes :: Integer -> IO ()
mersennePrimes p = do
  print(show p)
  let p1 = (2^p - 1) in
    do
      r <- primeMR 5 p1
      when (r) $ mersennePrimes p1

-- Findings:
{-
mersennePrimes m2
"7"
"127"
"170141183460469231731687303715884105727" (= m12: 2^127-1)

mersennePrimes m3
"31"
"2147483647" (= m8: 2^31-1)

mersennePrimes 11213
"11213"
"2814112013697373133393152975842584191818662382013600787892419349345515176682276313810715094745633257074198789308535071537342445016418881801789390548709414391857257571565758706478418356747070674633497188053050875416821624325680555826071110691946607460873056965360830571590242774934226866183966309185433462514537484258655982386235046029227507801410907163348439547781093397260096909677091843944555754221115477343760206979650067087884993478012977277878532807432236554020931571802310429923167588432457036104110850960439769038450365514022349625383665751207169661697352732236111926846454751701734527011379148175107820821297628946795631098960767492250494834254073334414121627833939461539212528932010726136689293688815665491671395174710452663709175753603774156855766515313827613727281696692633529666363787286539769941609107777183593336002680124517633451490439598324823836457251219406391432635639225604556042396004307799361927379900586400420763092320813392262492942076312933268033818471555255820639308889948665570202403815856313578949779767046261845327956725767289205262311752014786247813331834015084475386760526612217340579721237414485803725355463022009536301008145867524704604618862039093555206195328240951895107040793284825095462530151872823997171764140663315804309008611942578380931064748991594407476328437785848825423921170614938294029483257162979299388940695877375448948081108345293394327808452729789834135140193912419661799488795210328238112742218700634541149743657287232843426369348804878993471962403393967857676150371600196650252168250117793178488012000505422821362550520509209724459895852366827477851619190503254853115029403132178989005195751194301340277282730390683651120587895060198753121882187788657024007291784186518589977788510306743945896108645258766415692825664174470616153305144852273884549635059255410606458427323864109506687636314447514269094932953219924212594695157655009158521173420923275882063327625408617963032962033572563553604056097832111547535908988433816919747615817161606620557307000377194730013431815560750159027842164901422544571224546936793234970894954668425436412347785376194310030139080568383420772628618722646109707506566928102800033961704343991962002059794565527774913883237756792720065543768640792177441559278272350823092843683534396679150229676101834243787820420087274028617212684576388733605769491224109866592577360666241467280158988605523486345880882227855505706309276349415034547677180618296352866263005509222254318459768194126727603047460344175581029298320171226355234439676816309919127574206334807719021875413891580871529049187829308412133400910419756313021540478436604178446757738998632083586207992234085162634375406771169707323213988284943779122171985953605897902291781768286548287878180415060635460047164104095483777201737468873324068550430695826210304316336385311384093490021332372463463373977427405896673827544203128574874581960335232005637229319592369288171375276702260450911735069504025016667755214932073643654199488477010363909372005757899989580775775126621113057905717449417222016070530243916116705990451304256206318289297738303095152430549772239514964821601838628861446301936017710546777503109263030994747397618576207373447725441427135362428360863669327157635983045447971816718801639869547525146305655571843717916875669140320724978568586718527586602439602335283513944980064327030278104224144971883680541689784796267391476087696392191" (= m23: 2^ 11,213 - 1)
-}

-- Exercise 8:
--  Demonstrate how a pair p; q that you found can be used for public key encoding and decoding
rsaExample :: Integer -> IO ()
rsaExample message = do
  (p,q) <- genPrimePairSameBitLength
  let publicKey = rsa_public p q
      privateKey = rsa_private p q
      encodedMessage = rsa_encode publicKey message
      decodedMessage = rsa_decode privateKey encodedMessage in
        do
          print("Message: " ++ show(message))
          print("Encoded message: " ++ show(encodedMessage))
          print("Decoded message: " ++ show(decodedMessage))

-- Generates a pair of primes with same bit length
genPrimePairSameBitLength :: IO (Integer, Integer)
genPrimePairSameBitLength = do
  p1 <- genPrime
  p2 <- genPrime
  let b1 = bitLength p1
      b2 = bitLength p2 in
      do
        if b1 == b2 then return (p1,p2) else genPrimePairSameBitLength

-- Generates a prime between m8 and m12
genPrime :: IO Integer
genPrime = do
  n <- randomRIO(m8, m12)
  getNextPrime n

-- Takes an integer and returns the next prime number
getNextPrime :: Integer -> IO Integer
getNextPrime n = do
  r <- primeMR 5 n
  if r then return n else getNextPrime (n+1)

-- Calculates the bit length of an integer (source: http://reference.wolfram.com/mathematica/ref/BitLength.html)
bitLength :: Integer -> Integer
bitLength n = floor $ (logBase 2 (fromIntegral n)) + 1
