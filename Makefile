build:
	gcc -Wall -Wextra -Werror rpn_calc.c -o rpn_calc

build_correct:
	gcc -Wall -Wextra -Werror correct_rpn_calc.c -o rpn_calc
	

test:
	./rpn_calc "2 3 -" "5 6 +"
	@echo "Correct Answer: Error"
	./rpn_calc "2 -"
	@echo "Correct Answer: Error"
	./rpn_calc "-"
	@echo "Correct Answer: Error"

	./rpn_calc "2 5 6 -"
	@echo "Correct Answer: Error"

	./rpn_calc "3 4 +"
	@echo "Correct Answer: 7"
	./rpn_calc "2 4 + 8 *"
	@echo "Correct Answer: 48"
	./rpn_calc "50 10 25 + -"
	@echo "Correct Answer: 15"
	./rpn_calc "1000 5 2 * /"
	@echo "Correct Answer: 100"
	./rpn_calc "1000 3 %"
	@echo "Correct Answer: 1"
	./rpn_calc "1000 0 /"
	@echo "Correct Answer: Error"
	./rpn_calc "1000 0 %"
	@echo "Correct Answer: Error"
	./rpn_calc "-1000 -1 *"
	@echo "Correct Answer: 1000"
	./rpn_calc "-111 45 123 * 26 73 + + - 78 * -85 / 123 -"
	@echo "Correct Answer: 5148"
	./rpn_calc "78 326 542 96 1452 36 965 % - * / - +"
	@echo "Correct Answer: 404"
