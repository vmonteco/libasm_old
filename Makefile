NAME =		libasm.a
AS =		nasm
CC =		gcc

SRC =		ft_strlen.s \
			ft_strcpy.s # \
			# ft_strcmp.s \
			# ft_write.s \
			# ft_read.s \
			# ft_strdup.s

BONUS_SRC =	ft_atoi_base.s \
			ft_list_push_front.s \
			ft_list_size.s \
			ft_list_sort.s \
			ft_list_remove_if.s

OBJ =		$(subst .s,.o,$(SRC))
BONUS_OBJ =	$(subst .s,.o,$(BONUS_SRC))


all: $(NAME)

$(NAME): $(OBJ)
	ar rc $@ $(OBJ)
	ranlib $@

%.o: %.s
	$(AS) -f elf64 -o $@ $^

test_exe: main.c $(NAME)
	$(CC) $(CFLAGS) -L. -lasm -o $@ main.c

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
