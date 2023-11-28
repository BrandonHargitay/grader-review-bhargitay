CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
printf '\nFinished cloning\n\n'


cd ./student-submission
if [ -f "ListExamples.java" ]; then 
  printf "ListExamples.java found!\n\n"
else
  printf "ListExamples.java not found, is your file named correctly?\n"
  exit
fi
printf "Compiling files................\n\n"
cd ../grading-area
cp ../student-submission/ListExamples.java .
cp ../TestListExamples.java .
mkdir lib
cp ../lib/*.jar ./lib
touch file.txt

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java >> file.txt 2>&1
exit_status=$?
if [ $exit_status -eq 1 ]; then
    printf "###########################################################\n"
    printf "| ERROR! Your script did not complie due to the following |\n"
    printf "###########################################################\n\n"
    cat file.txt
    exit
else
    printf "Files complied"g
fi
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
