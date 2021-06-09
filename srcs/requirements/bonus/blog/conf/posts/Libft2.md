---

title: "Libft 2"

preview: "strlen, strlcpy, strlcat, strchr, strrchr, strnstr"

date: "2021-06-08"

author: "Jaekpark"

previous: "Libft2"

next: "Libft3"

coverUrl: "https://www.asidesigned.com/images/programming-projects-img/project-libft.jpg"

---

# strlen
+ **Synopsis**
```c
#include <string.h>

size_t strlen(const char *s)
```
+ **Description**
	+ 문자열의 길이를 반환하는 함수.
	+  `C언어`에서 말하는 문자열의 길이는 `NULL`문자 직전까지의 문자 개수를 말한다.

+ **Parameter**
	+ `*s` : 문자열 시작 주소.

+ **Return Value**
	+ 문자열의 길이

+ **Source Code**
```c
size_t strlen(const char *s)
{
	size_t count;
	
	count = 0;
	while (s[count])
		count++;
	return (count);
}
```
# strlcpy

+ **Synopsis**
```c
#include <string.h>

size_t strlcpy(char *dst, const char *src, size_t size)
```
+ **Description**
	+  문자열 복사 함수
	+ `dst`에 `size-1` 만큼 `src`를 복사한다.
	+ 복사가 완료 된 후 `dst`는 반드시 `NULL` 문자로 종료 되어야 한다.

+ **Parameter**
	+ `dst` : 복사 대상이 되는 메모리 버퍼의 시작 주소
	+ `src` : 피복사 대상이 되는 메모리 시작 주소
	+  `size` : `dst`로 복사할 `src`의 사이즈

+ **Return Value**
	+ `src`의 길이를 반환한다.
	+ `dst` 혹은 `src`가 비어있는 경우에는 `0`을 반환한다.

+ **Source Code**
```c
size_t	strlcpy(char *dst, const char *src, size_t size)
{
	size_t srclen;
	
	srclen = strlen(src);
	if (!dst || !src)
		return (0);
	if (size == 0)
		return (srclen);
	while (*src && --size)
	{
		*dst = *src;
		dst++;
		src++;
	}
	*dst = '\0';
	return (srclen);
}
```
```c
size_t strlcpy(char *dst, const char *src, size_t size)
{
	size_t ret;
	size_t len;
	
	ret = strlen(src);
	len = (ret >= size) ? size - 1:ret;
	if (size)
	{
		memcpy(dst, src, len);
		dst[len] = '\0';
	}
	return (ret);
}
```

# strlcat

+ **Synopsis**
```c
#include <string.h>

size_t strlcat(char *dst, const char *src, size_t size)
```

+ **Description**
	+ 문자열 연결 함수
	+ `dst` 가 끝나는 지점부터 `src`의 문자열을 `size`만큼 연결 시킨다.
	+ 연결이 끝난 뒤 반드시 'NULL' 문자로 종료 된다.

+ **Parameter**
	+ `dst` : 문자열 연결의 대상이 되는 문자열
	+ `src` : `dst` 이후에 연결 시킬 대상 문자열
	+ `size` : `dst`에 `src`를 이어 붙일 수 있는 버퍼 메모리 사이즈
+ **Return Value**
	+ `size`가 `dst`의 길이보다 작거나 같은 경우 `src`길이에 `size`가 더한 값을 반환
	+ `dst`에 `src`를 성공적으로 모두 연결 시킨 경우 `dst`와 `src` 길의의 합을 반환
	
+ **Soucre Code**
```c
size_t strlcat(char *dst, const char *src, size_t size)
{
	size_t i;
	size_t count;

	i = strlen(dst);
	if (size <= strlen(dst)
		return (strlen(src) + size);
	count = size - strlen(dst) - 1;
	while (*src && count--)
	{
		dst[i] = *src;
		i++;
		src++;
	}
	dst[i] = '\0';
	return (strlen(dst) + strlen(src));
}
```

# strchr

+ **Synopsis**
```c
#include <string.h>

char	*strchr(const char *str, int c)
```

+ **Description**
	+ 문자열에서 특정한 문자가 가장 먼저 나타나는 곳의 위치를 찾는 함수

+ **Parameter**
	+ `str` : 특정 문자를 찾을 대상 문자열
	+ `c` : `str`내에서 검색할 문자. 함수 내부에서 `unsigned char`형으로 변환되어 사용.

+ **Return Value**
	+ `str`내에서 문자 `c`가 가장 먼저 나타나는 곳의 주소를 반환

+ **Source Code**
```c
char *strchr(const char *s, int c)
{
	while (*s)
	{
		if(*s == (char)c)
			return ((char *)s);
		s++;
	}
	if (*s == (char)c)
		return ((char *)s);
	return (NULL);
}
```

# strrchr

+ **Synopsis**
```c
#include <string.h>

char *strrchr(const char *s, int c)
```
+ **Description**
	+ 문자열에서 특정 문자를 검색하는 함수
	+ `strchr`은 가장 먼저 등장한 위치를 반환하지만 `strrchr`은 가장 나중에 등장한 문자열의 위치를 찾는 함수.

+ **Parameter**
	+ `s` : 탐색의 대상이 되는 문자열
	+  `c` : `s`에서 찾을 대상 문자열 역시 `unsigned char`형으로 변환되어 사용된다.

+ **Return Value**
	+ `s` 에서 가장 마지막에 등장하는 문자 `c`의 주소
	+ 찾지 못한 경우 `NULL` 반환

+ **Source Code**
```c
 char	*strrchr(const char *s, int c)
 {
	 int	len;
	 len = strlen((unsigned char *)s);
	 while (len != 0 && s[len] != (unsigned char)c)
		 len--;
	if (s[len] == (unsigned char)c)
		return ((usigned char *)&s[len]);
	return (NULL);
}
```

# strnstr

+ **Synopsis**
```c
#include <string.h>

char *strnstr(const char *haystack, const char *needle, size_t len)
```

+ **Description**
+	대상 문자열의 특정 길이 내에서 특정 문자열을  찾는 함수

+ **Parameter**
	+ `haystack` : 탐색 대상 문자열
	+ `needle` : 찾고자 하는 문자열
	+ `len` : `haystack`에서 탐색 범위가 되는 길이

+ **Return Value**
	+ `needle`의 값이 비어 있으면 `haystack` 반환
	+ `haystack`에서 `needle`을 찾지 못한 경우 `NULL` 반환
	+ `needle`을 `haystack`에서 찾은 경우 해당 위치 주소 반환

+ **Source Code**
```c
char	*strnstr(const char *haystack, const char *needle, size_t len)
{
	size_t i;
	size_t j;
	
	i = 0;
	if (needle[i] == '\0')
		return ((char *)haystack);
	while (haystack[i] && i < len)
	{
		j = 0;
		if (haystack[i] == needle[j])
		{
			while (i + j < len && haystack[i + j] == needle[j])
			{
				j++;
				if (needle[j] == '\0')
					return ((char *)&haystack[i]);
			}
		}
		i++;
	}
	return (NULL);
}
```
