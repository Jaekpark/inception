---

title: "printf"

preview: "Variable argument"

date: "2021-06-10"

author: "jaekpark"

previous: "Netwhat"

coverUrl: "https://prepinsta.com/wp-content/uploads/2020/05/printing-_-using-printf1.webp"

---

# printf()

###  Synopsis
- `printf()` 함수는 다양한 자료형 변수를 문자열로 변환하는 방식을 지정해주는 **형식 문자열 (format string)** 변수를 받아들여 표준 출력으로 시스템에 print하는 함수다.
	- **prototype**
```c
int printf(const char *format, ...)
```
- **foramt**
    - `%[flag][width][.precision][length]specifier`

<p />

- `printf()` 함수를 이해하기 위해 알아야 할 개념은 아래와 같다.
	1. 가변인자
	2. 플래그
	3. 넓이
	4. 정밀도
	5. 길이
	6. 형식 지정자

---
### Description

- **가변인자 (Variable argument)**
	- C 언어의 함수 중에서  `printf()`, `scanf()`와 같이 매개변수의 개수가 정해지지 않은 함수가 있다. 이런 함수들 처럼 **함수 인자가 가변적**인 경우 사용 되는 개념이 **가변 인자(Variable argument)** 다.

```c
	// 예시
	
	#include <stdio.h>
	
	void print_something(int args, ...)
	{
		printf("%d", args);
	}
	
	int main(void)
	{
		print_something(1, 10);
		print_something(2, 10, 20);
		print_something(3, 10, 20, 30);
		print_something(4, 10, 20, 30 ,40);
		
		return (0);
	}
    
```
---
- 위와 같은 프로그램에서 `print_something()` 함수를 호출할 때 **가장 처음 오는 인자(paramter)** 는 `args`에 담기고, 나머지 부분들은 `...`에 담긴다.
- `...`에 담긴 매개변수를 사용하기 위해서는 `stdarg.h` 라이브러리에 정의된 매크로를 이용해야 한다. 해당 매크로의 종류는 아래와 같다.
		1.  `va_list` : 가변 인자의 메모리 주소를 저장하는 포인터
		2. `va_start` : 가변 인자를 가져올 수 있도록 하는 포인터 설정 매크로
		3.  `va_arg` : 가변 인자 포인터에서 특정 자료형 크기만큼 값을 가져오는 매크로
		4.  `va_end` : 가변 인자 처리가 끝난 경우 포인터를 `NULL`로 처리하는 매크로



```c

#include <stdio.h>
#include <stdarg.h>

void	print_something(int args, ...)
{
	va_list ap;
    
	va_start(ap, args);
	for (int i = 0; i < args; i++)
	{
		int num = va_arg(ap, int);
		printf("%d ", num);
	}
	va_end(ap);
	printf("\n");
}

int main(void)
{
	print_something(1, 10);
	print_something(2, 10, 20);
	print_something(3, 10, 20, 30);
	print_something(4, 10, 20, 30, 40);
    
	return (0);
}
```

- `va_list ap;` : 가변 인자 목록을 가리킬 포인터 생성
- `va_start(ap, args);` : 가변 인자 목록 포인터 설정
    - `print_something(1, 10)`

		| ----memory  | 10     | ...  | ...  |
		| ----------- | ------ | ---- | ---- |
		| ----address | 0x0000 | ...  | ...  |
		| ----pointer | ^ ap   |      |      |
      
	- `print_something(2, 10, 20)`
	
		| ----memory | 10   | 20   | ...  |
		| ---------- | ---- | ---- | ---- |
		|----address|0x0010|0x0011|...
		|----pointer|^ ap|


	- `print_something(3, 10, 20, 30)`				
	
		|----memory|10|20|30|
		|-----|---|---|---|
		|----address|0x0100|0x0101|0x0102
		|----pointer|^ ap|


​		
	- `print_something(4, 10, 20, 30, 40)`
	
		|----memory|10|20|30|40|
		|-----|---|---|---|---|
		|----address|0x1000|0x1001|0x1002|0x1003
		|----pointer|^ ap|
