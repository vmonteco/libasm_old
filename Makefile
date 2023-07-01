NAME =			libasm.a
NAME_SHARED =	$(subst .a,.so,$(NAME))
AS =			nasm
CC =			gcc
CFLAGS =		-Wall -Werror -Wextra

ifeq ($(UNAME_S),Linux)
	CC_FLAGS=-Wl,--whole-archive
	CLOSING=-Wl,--no-whole-archive
else
	CC_FLAGS=-Wl,-all_load
	CLOSING=
endif

SRC =			ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_read.s \
				ft_strdup.s

BONUS_SRC =		ft_atoi_base.s \
				ft_list_push_front.s \
				ft_list_size.s \
				ft_list_sort.s \
				ft_list_remove_if.s

OBJ =			$(subst .s,.o,$(SRC))
BONUS_OBJ =		$(subst .s,.o,$(BONUS_SRC))


all: $(NAME)


$(NAME): $(OBJ)
	ar rc $@ $(OBJ)
	ranlib $@


$(NAME_SHARED): $(NAME)
	$(CC) -shared -o $@ $(CC_FLAGS) $< $(CLOSING)


%.o: %.s
	$(AS) -f elf64 -o $@ $^


test_exe: main.c $(NAME)
	$(CC) $(CFLAGS) -o $@ main.c -L. -lasm


test: test_exe
	./$<


test_bonus_exe:


bonus: test_bonus_exe
	./$<


.PHONY: test bonus


clean:
	rm $(OBJ)


fclean: clean
	rm $(NAME)


re: fclean all
