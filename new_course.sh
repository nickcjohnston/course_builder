#!/bin/bash

# TODO Get from param or confirm with user
set_base_dir() {
	BASE=/home/$USER/courses
	mkdir -p $BASE
}

# TODO Separate code from number to better look up outline?
get_course_info() {
	echo -n "Enter Course Code> "
	read -r CODE
	mkdir $BASE/$CODE
	echo -n "Enter Course Name> "
	read -r NAME
}

# TODO Init the repo with LICENSE, README, .gitignore, etc.
create_repo() {
	git init "$BASE/$CODE"
}

# TODO Replace classplan and outline touches with actual template
make_folders() {
	mkdir -p $BASE/$CODE/{modules,syllabus,assessments,instructor}
	mkdir -p $BASE/$CODE/instructor/{lesson_plans,completed_exercises,assessment_solutions}
	touch $BASE/$CODE/syllabus/class_plan.txt
	touch $BASE/$CODE/syllabus/course_outline.txt
}

# TODO Populate instructor content with lesson plan stubs for modules
# TODO Replace lesson plan with template stub
get_course_modules() {
	echo -n "Add new modules[Y/n]?> "
	read -r ANS
	while [ "$ANS" != "n" ]; do
		echo -n "Enter module name> "
		read -r MOD_NAME
		mkdir -p $BASE/$CODE/modules/$MOD_NAME/{content,readings,exercises,labs}
		touch $BASE/$CODE/instructor/lesson_plans/${MOD_NAME}_lesson_plan.txt
		echo -n "Add another module[Y/n]?> "
		read ANS
	done
}

# TODO Comman line arg parse and validate
# Main
set_base_dir
get_course_info
create_repo
make_folders
get_course_modules
