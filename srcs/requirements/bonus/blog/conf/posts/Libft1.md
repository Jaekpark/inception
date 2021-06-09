---
title: "Libft 1"
preview: "memset, bzero, memcpy, memccpy, memchr, memcmp, wchar_t"
date: "2021-06-08"
author: "Jaekpark"
next: "Libft1"
coverUrl: "https://www.asidesigned.com/images/programming-projects-img/project-libft.jpg"
---

# memset

- **Synopsis**
```c
#include <string.h>

void	*memset(void *ptr, int value, size_t num)
```
+ **Description**
	- ``ptr``로 시작하는 메모리 주소부터 ``num``개의 바이트를 ``value`` 값으로 채운다.
+ **Parameter**
	- ``ptr`` : 값을 채울 메모리의 시작주소
	- ``value`` : 메모리 블럭에 채울 값
	-  ``num`` : 시작 주소로 부터 value 값을 채울 메모리 블럭 개수
+ **Return Value**
	+ 메모리 시작 주소 ``ptr``이 리턴 된다.

+ **Source Code**
```c
void	*memset(void *ptr, int value, size_t num)
{
	unsigned char	*tmp;

	tmp = (unsigned char *)ptr;
	while (num--)
		*tmp++ = (unsigned char)value;
	return (ptr);
}
```

# bzero
- **Synopsis**
```c
#include <string.h>

void	bzero(void *ptr, size_t num)
```
* **Description**
	+ ``ptr``로 시작하는 메모리 주소부터 ``num``개의 메모리 블럭을 0으로 채운다.
+ **Parmeter**
	+ ``ptr ``: 값을 채울 메모리의 시작주소
	+ ``num`` : 시작 주소로 부터 0으로 채울 메모리 블럭 개수

> **memset vs bzero**
> `memset()` : ansi-c 
> `bzero()` : BSD
> `memset()` 함수가 C standard로 함수로 `bzero()` 보다 사용이 권장된다. 

+ **Source Code**
```c
void	bzero(void *ptr, size_t num)
{
	unsigned char *tmp;
	
	tmp = (unsigned char *)ptr;
	while (num--)
		*tmp++ = 0;
}
```
```c
void	bzero(void *ptr, size_t num)
{
	memset(ptr, 0, num);
}
```

# memcpy

* **Synopsis**
```c
#include <string.h>

void	*memcpy(void *dst, const void *src, size_t num)
```
+ **Description**
	+ ``src`` 포인터가 가리키는 메모리 블럭 부터 ``num`` 바이트 만큼을``dst`` 포인터가 가리키는 곳에 복사한다.
	+ 오버플로우 방지를 위해 ``dst``와 ``src``가 가리키는 메모리 블럭 범위의 크기는 ``num``바이트 이상이여야 하며, 서로 중복 되어서는 안된다.
	+  특정 자료형끼리의 값 복사가 아닌 메모리 블럭 자체의 이진 데이터 복사에 사용되는 함수로 전달 되는 두 매개 변수 ``dst`` 와 ``src``의 자료형이 반드시 일치될 필요는 없다.

+ **Parameter**
	+ ``dst`` : 데이터가 복사될 메모리의 시작 주소, ``` void * ``` 형으로 형 변환되어 전달된다. 
	+ ``src`` : 복사할 데이터들이 위치한 주소 ```void *```로 형 변환 되어 전달된다.
	+  ``num`` : 복사할 데이터의 바이트 수

+ **Return Value**
	+ 복사 대상이 되는 메모리 블럭의 시작 주소 ``dst`` 가 리턴된다.

 > **``dst``와 ``src``의 메모리 블럭이 겹치는 경우**
 > ``memmove()`` 사용 권장

+ **Source Code**
```c
void	memcpy(void *dst, const void *src, size_t num)
{
	unsigned char *dest;
	unsigned char *source;

	dest = (unsigned char *)dst;
	source = (unsigned char *)src;
	while (num--)
		*dest++ = *src++;
	return (dst);
}
```

# memccpy

* **Synopsis**
```c
#include <string.h>

void	*memccpy(void *dst, const void *src, int c, size_t num)
```
+ **Description**
	+ ``src`` 포인터가 가리키는 메모리 블럭부터``num	`` 바이트만큼의 데이터 `dst`에 복사한다. 이 때 복사는 `src`에서 `c`를 발견하기까지 수행한다.
	+`src`에서 `c`와 같은 데이터를 만나면 `c` 까지 `dst`에 복사하고 중단한다.

* **Parameter**
	* `dst` : 데이터가 복사될 메모리의 시작 주소
	* `src` : 복사할 데이터가 위치한 메모리의 시작 주소
	*` c` : `src`에서 만나면 복제를 중단할 데이터(`memccpy` 함수 내부에서 ```unsigned char``` 형으로 변환되어 사용된다.
	* `num` : 복제할 데이터의 바이트 수

* **Return Value**
	+ `dst`에 복제가 끝난 데이터의 다음 메모리 번지
	+ 즉 `src` 영역에 데이터 c가 존재한다면 `dst`에 `c`까지 복사를 한 후, `c`가 복제된 다음 위치의 메모리 주소를 반환한다.
	+ `src`에 `c`가 없다면 `num` 바이트 만큼 복사하고 `NULL`을 반환한다.

+ **Source Code**
```c
void	memccpy(void *dst, const void *src, int c, size_t num)
{
	unsigned char *dest;
	unsigned char *source;
	
	dest = (unsigned char *)dst;
	source = (unsigned char *)src;
	while (num--)
	{
		*dest = *source;
		if (*dest == (unsigned char)c)
			return ((void *)++dest);
		dest++;
		source++;
	}
	return (NULL);
```

# memchr
+ **Synopsis**
```c
#include <string.h>

void	memchr(void *ptr, int value, size_t num)
```
+ **Description**
	+ `ptr` 로 시작 되는 메모리 블럭부터 `num` 바이트 만큼의 범위 내에서 `value`값을 찾는다.

+ **Parameter**
	+ `ptr` : `value`값을 찾을 메모리 블럭 범위의 시작 위치 주소
	+ `value` : 메모리 블럭 범위 내에서 찾을 값, 여타 다른 `mem`함수와 마찬가지로 `unsigned char`형의로 변환되어 사용된다.
	+ `num` : `ptr`부터 찾을 메모리 블럭 바이트 수

+ **Return Value**
	+ `ptr`부터 `num` 바이트 범위 내에서 `value` 값을 찾을 경우 해당 주소 반환
	+ 값을 찾지 못한다면 `NULL` 반환

+ **Source Code**
```c
void	*memchr(void *ptr, int value, size_t num)
{
	unsigned char *ptr_tmp;

	ptr_tmp = (unsigned char *)ptr;
	while (num--)
	{
		if (*ptr_tmp == (unsigned char)value)
			return (ptr_tmp);
		ptr_tmp++;
	}
	return (NULL);
}
```
# memcmp

+ **Synopsis**
```c
#include <string.h>

int	memcmp(const void *ptr1, const void *ptr2, size_t num)
```

+ **Description**
	+ `ptr1`과 `ptr2` 로 시작되는 메모리 블럭 부터 `num` 바이트 만큼 값을 비교하는 함수.

+ **Parameter**
	+`ptr1` : 비교할 메모리 블럭의 주소를 가리키는 포인터
	+`ptr2` : `ptr1`의 값과 비교할 메모리 블럭 주소를 가리키는 포인터
	+`num` :  비교할 메모리 블럭 바으트 수

+ **Return Value**
	+ 두 메모리 블럭이 `num` 바이트 만큼 정확히 일치하면 `0`을 반환
	+ 두 메모리 블럭이 다를 경우 다른 메모리 블럭 값을 비교하여 `0`보다 크거나 작은 값 반환
		+ `ptr1 > ptr2` : `0`보다 큰 값 반환
		+ `ptr1 < ptr2` : `0` 보다 작은 값 반환

+ **Source Code**
```c
int	memcmp(const void *ptr1, const void *ptr2, size_t num)
{
	unsigned char *ptr1_tmp;
	unsigned char *ptr2_tmp;

	ptr1_tmp = (unsigned char *)ptr1;
	ptr2_tmp = (unsigned char *)ptr2;
	while (num--)
	{
		if(*ptr1_tmp != *ptr2_tmp)
			return (*ptr1_tmp - *ptr2_tmp);
		ptr1_tmp++;
		ptr2_tmp++;
	}
	return (0);
}
```

# wchar_t
+ **Synopsis**
```c
wchar_t wc = L'a';
wchar_t *ws = L"Hello World!";
```
+ **Description**
	+ `와이드 문자(wide character)` 저장하기 위한 자료형 보통 `ascii code`와 같은 문자는 `1 byte` 크기로 표현하지만 `unicode` 와 같은 경우 `2 byte`이상으로 표현하기 때문에 `wchar_t`에 저장한다.
		+ `visual studio`에서는 `wchar_t`를 `unsigned short(2byte)`로 정의한다.
		+ `GCC`에서는 `4byte` 크기로 정의한다.
			+ `-fshort-wchar` 옵션 사용시 `2byte`로 사용 가능하다.
	+  `wchar_t`문자열은 보통 따옴표 앞에 `대문자 L`을 붙여 사용한다.
		+ `_T()` 매크로 함수를 사용할 수 도 있다.
	+ `wchar_t` 자료형으로 선언된 변수는 `char`형 문자의 비교, 출력, 복사 등에 활용되는 함수에서 사용 할 수 없다. 따라서 같은 함수명에 `w`가 접두사로 붙는 함수들이 존재한다.
		+ 예시 : `wmemset`,`wmemcmp`, `wscanf`, `wprintf` 등
