/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/12 05:14:14 by vmonteco          #+#    #+#             */
/*   Updated: 2023/07/02 16:11:53 by vmonteco         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include "libasm.h"

void	test_ft_strlen(void){
	size_t		i;
	char		*s;
	
	/*
	** NULL case is undefined behaviour :
	** https://www.open-std.org/Jtc1/sc22/WG14/www/docs/dr_451.htm
	*/

	/* Empty string */
	s = malloc(1*sizeof(char));
	if (s){
		s[0] = 0;
		printf("-ft_strlen with empty str :\nExpected_result : %d.\nGot %zd.\nstrlen returns %zd.\n", 0, ft_strlen(s), strlen(s));
		free(s);
	}else{
		printf("-ft_strlen with empty str : Unsuccessful allocation\n.");
	}

	/* Non empty string */
	s = malloc((42+1)*sizeof(char));
	if (s){
		i = 0;
		while (i < 42){
			s[i] = 'a';
			i++;
		}
		s[i] = 0;
		printf("-ft_strlen with non empty str :\nExpected_result : %d.\nGot %zd.\nstrlen returns %zd.\n", 42, ft_strlen(s), strlen(s));
		free(s);
	}else{
		printf("-ft_strlen with non empty str : Unsuccessful allocation\n.");
	}	
}


void	test_ft_strcpy(void)
{
	char	*std;
	char	*libasm;

	/* Empty string case ("") */
	printf("empty string\n");
	if ((std = malloc((strlen("FOO") + 1) * sizeof(char))))
	{
		strcpy(std, "FOO");
		printf("FOO-1\n");
		if ((libasm = malloc((strlen("FOO") + 1) * sizeof(char))))
		{
			printf("FOO-2\n");
			ft_strcpy(libasm, "FOO");
			printf("FOO-3\n");
			printf("-ft_strcpy, empty string case (\"\") :\nstrcpy returned %d.\n", strcmp(std, libasm));
			free(libasm);
		}
		free(std);
	}

	/* Basic case ("FOO") */
	printf("Basic case");
	if ((std = malloc((strlen("FOO") + 1) * sizeof(char))))
	{
		strcpy(std, "FOO");
		if ((libasm = malloc((strlen("FOO") + 1) * sizeof(char))))
		{
			ft_strcpy(libasm, "FOO");
			printf("-ft_strcpy, basic case (\"FOO\") :\nstrcpy returned %d.\n", strcmp(std, libasm));
			free(libasm);
		}
		free(std);
	}
}

int		main(void)
{
	test_ft_strlen();
	test_ft_strcpy();
	return (0);
}
