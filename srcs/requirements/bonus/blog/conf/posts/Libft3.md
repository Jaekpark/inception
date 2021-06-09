---

title: "Libft 3"

preview: "memset, bzero, memcpy, memccpy, memchr, memcmp, wchar_t"

date: "2021-06-08"

author: "Jaekpark"

previous: "Libft2"

next: "Libft4"

coverUrl: "https://www.asidesigned.com/images/programming-projects-img/project-libft.jpg"

---

# memmove

 + **Synopsis**
```c
#include <string.h>

void	*memmove(void *dst, const void *src, size_t num)
```

+ **Description**
	+ 메모리 블럭을 옮기는 함수.
	+ `src`가 가리키는 메모리 블럭부터 `num` 바이트 만큼을 `dst`가 가리키는 메모리 블럭으로 옮긴다.
	+ 메모리 복사 수행시 중간에 `버퍼`를 이용하므로 `dst`와 `src`가 겹쳐도 문제 없이 실행된다.
	+ `src`의 `NULL` 종료 문자를 확인하지 않는다. 정확히 `num`바이트 만큼 복사를 수행한다.
	+ 오버플로우 방지를 위해 `dst`와 `src`가 가리키는 메모리 블럭이 적어도 `num`바이트 이상은 되어야 한다.

+ **Parameter**
	+ `dst`: 데이터가 복사 될 주소를 가리키는 포인터
	+ `src` : 복사할 데이터가 있는 메모리 블럭 주소
	+ `num` : 복사할 데이터 바이트 수

+ **Return Value**
	+ `dst`가 반환된다.

+ **Source Code**
```c
void	*memmove(void *dst, const void *src, size_t num)
{
	size_t i;
	char *dst_tmp;

	i = 0;
	dst_tmp = (unsigned char *)dst;
	if (!dst && !src)
		return (NULL);
	if (dst > src)
	{
		while (num > 0)
		{
			dst_tmp[num - 1] = (unsigned char *)src)[num - 1];
			num--;
		}
	}
	else
	{
		while (i < num)
		{
			dst_tmp[i] = ((unsigned char *)src)[i];
			i++;
		}
	}
	return (dst);
}
```
# strncmp
+ **Synopsis**
```c
#include <string.h>

size_t	strncmp(const char *s1, const char *s2, size_t num)
```

+ **Description**
	+ 두 문자열의 특정 부분을 비교한다.
	+ `s1`의 처음 `num`개 문자열을 `s2`의 처음 `num`개 문자열과 비교한다.
	+ `NULL`에 도달하거나 `num`개의 문자열을 모두 비교할 때 까지 비교를 수행한다.

+ **Parameter**
	+ `s1` : 비교할 문자열
	+ `s2` : `s1`과 비교할 문자열
	+ `num` : 비교할 문자의 개수

+ **Return Value**
	+ `num`개의 문자가 모두 일치한다면 `0`을 반환한다.
	+ 비교한 `num`개의 문자 중 최초로 일치하지 않는 문자의 값이 `s1`이 더 큰 경우 `0 보다 큰 값` `s2`가 더 큰 경우 `0 보다 작은 값`을 반환한다.

+ **Source Code**
```c
size_t strncmp(const char *s1, const char *s2, size_t num)
{
	unsigned char *str1;
	unsigned char *str2;
	
	str1 = (unsigned char *)s1;
	str2 = (unsigned char *)s2;
	while (num--)
	{
		if (*str1 != *str2)
			return (str1 - str2);
		str1++;
		str2++;
	}
	return (0);
}
```

# atoi

+ **Synopsis**
```c
#include <stdlib.h>

int	atoi(const char *str)
```

+ **Description**
	+ 문자열을 정수로 변환하는 ㅎ마수
	+ 이 함수는 문자열에서 비공백 문자가 나오기 전까지 최대한 많은 공백문자를 무시한다. 그 다음 첫 번째 비공백 문자부터 최대한 많은 숫자를 수로 변환한다.
	+ 숫자 앞에 `+` , `-`가 나올 수 도있다.
	+ 숫자 다음에 나타나는 문자들은 무시된다.

+ **Paramter**
	+ `str` : 수로 변환할 대상이 되는 문자열

+ **Return Value**
	+ 변환에 성공하면 `int` 값을 반환
	+ 반환에 실패하면 `0`을 반환
	+ 표현 가능한 범위를 벗어난다면 `INT_MAX` 혹은 `INT_MIN` 값을 반환

+ **Source Code**
```c
int	atoi(const char *str)
{
	int i;
	int sign;
	int result;
	
	i = 0;
	sign = 1;
	result = 0;
	while (str[i] == ' ' || (str[i] >= 9 && str[i] <= 13))
		i++;
	if (str[i] == '+' || str[i] == '-')
	{
		if (str[i] == '-')
			sign *= -1;
		i++;
	}
	while (str[i] >= '0' && str[i] <= '9')
	{
		result *= 10;
		result += str[i] - '0';
		i++;
	}
	return (result * sign);
}
```
# isalpha
+ **Synopsis**
```c
#include <ctype.h>

int isalpha(int c)
```
+ **Description**
	+ 어떤 문자가 알파벳인지 아닌지 확인하는 함수
+ **Parameter**
	+ `c` : 알파벳인지 확인할 대상문자 `ascii code` 값으로 들어온다.
+ **Return Value**
	+ 알파벳이 맞다면 `1`을 반환 아니라면 `0`을 반환한다.
+ **Source Code**
```c
  int ft_isalpha(int c)
  {
	  if ((c >= 65 && c <= 90) || (c >= 97 && c <= 122))
		  return (1);
	  return (0);
  }
```
# isdigit
+ **Synopsis**
```c
#include <ctype.h>

int	isdigit(int c)
```
+ **Description**
	+ 특정 문자가 숫자인지 확인하는 함수
+ **Parameter**
	+ `c` : 확인할 대상 문자 `ascii code` 값으로 들어온다.
+ **Return Value**
	+ 숫자가 맞으면 `1` 아니면 `0`을 반환
+ **Source Code**
```c
int	isdigit(int c)
{
	if (c >= 48 && c <= 57)
		return (1);
	return (0);
}
```
#	isalnum
+ **Synopsis**
```c
#include <ctype.h>

int	isalnum(int c)
```
+ **Description**
	+ 특정 문자가 알파벳 혹은 숫자인지 확인하는 함수
+ **Parameter**
	+ `c` : 확인할 대상 문자의 `ascii code` 값
+ **Return Value**
	+	숫자 혹은 문자인 경우 `1` 반환 아닌 경우에는 `0`반환

+ **Source Code**
```c
int	isalnum(int c)
{
	if (c >= 48 && c <= 57)
		return (1);
	else if (c >= 65 && c <= 90)
		return (1);
	else if (c >= 97 && c <= 122)
		return (1);
	return (0);
}
```
# isascii
+ **Synopsis**
```c
#include <ctype.h>

int	isascii(int c)
```
+ **Description**
	+ 특정 문자가 아스키 코드 문자인지 확인하는 함수
+ **Parameter**
	+ `c` : 확인할 대상 문자
+ **Return Value**
	+ 아스키 코드 문자가 맞으면 `1` 반환 아니면 `0`반환
+ **Source Code**
```c
int	isascii(int c)
{
	if (c >= 0 && c <= 255)
		return (1);
	return (0);
}
```
#	isprint
+ **Synopsis**
```c
#include <ctype.h>

int isprint(int c)
```
+ **Description**
	+ 어떤 문자가 출력가능한 문자인지 비출력 문자인지 확인하는 함수
+ **Parameter**
	+ `c` : 확인할 대상 문자의 `ascii code` 값
+ **Return Value**
 	+  출력가능 문자인 경우 `1`을 비출력 문자인 경우 `0`을 반환
+ **Source Code**
```c
int isprint(int c)
{
	if (c >= 32 && c <= 126)
		return (1);
	return (0);
}
```
# toupper
+ **Synopsis**
```c
#include <ctype.h>

int	toupper(int c)
```
+ **Description**
	+ 특정 문자가 알파벳 소문자면 대문자로 변환 해주는 함수.
+ **Parameter**
	+ `c` : 확인 후 변환 할 대상 문자의 `ascii code` 값
+ **Return Value**
	+ 소문자인경우 대문자로 변환 한 값을 반환 그 외의 경우 `c` 자체 반환
+ **Source Code**
```c
int toupper(int c)
{
	if (c >= 97 && c <= 122)
		return (c - 32);
	return (c);
}
```
# tolower
+ **Synopsis**
```c
#include <ctype.h>

int tolower(int c)
```
+ **Description**
	+ 특정 문자가 알파벳 대문자면 소문자로 변환해주는 함수.
+ **Parameter**
	+ `c` : 확인 후 변환 할 대상 문자의 `ascii code` 값
+ **Return Value**
	+ 대문자인 경우 소문자로 변환한 값을 반환 그 외의 경우 `c` 자체를 반환
+ **Source Code**
```c
int tolower(int c)
{
	if (c >= 65 && c <= 90)
		return (c + 32);
	return (c);
}
```
