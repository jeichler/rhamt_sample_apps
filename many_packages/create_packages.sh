#!bin/sh
# definitely doesn't win a beauty contest.
mkdir -p src/main/java
echo "starting package and class generation - this might take a while..."
mkdir emptydir
rsync -a --delete emptydir/ src/main/java # should be faster than rm
rmdir emptydir
mkdir -p src/main/java/com/acme/package{1..10}/package{1..10}/package{1..10}

for levelOne in {1..10}; do
  for levelTwo in {1..10}; do
    for levelThree in {1..10}; do
      cat SampleClassTemplate.txt | sed 's/PACKAGE/package'$levelOne'.package'$levelTwo'.package'$levelThree'/' > src/main/java/com/acme/package$levelOne/package$levelTwo/package$levelThree/SampleClass.java
      mkdir -p src/main/java/com/acme/package$levelOne/package$levelTwo/package$levelThree/package{1..15}/package{1..5}
      for levelFour in {1..10}; do
        cat SampleClassTemplate.txt | sed 's/PACKAGE/package'$levelOne'.package'$levelTwo'.package'$levelThree'.package'$levelFour'/' > src/main/java/com/acme/package$levelOne/package$levelTwo/package$levelThree/package$levelFour/SampleClass.java
        for levelFive in {1..5}; do
          cat SampleClassTemplate.txt | sed 's/PACKAGE/package'$levelOne'.package'$levelTwo'.package'$levelThree'.package'$levelFour'.package'$levelFive'/' > src/main/java/com/acme/package$levelOne/package$levelTwo/package$levelThree/package$levelFour/package$levelFive/SampleClass.java
        done
      done
    done
  done
done
