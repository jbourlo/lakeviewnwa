# seconds not minutes
echo "./capture.sh $(( 20 * 60 ))" | at 10:40am
echo "./capture.sh $(( 45 * 60 ))" | at 11:05am
