TARGET = main.ksm

SRCS = $(wildcard *.kasm)
OBJS = $(SRCS:.kasm=.ko)

all: $(TARGET)

$(TARGET): $(OBJS)
	kld $^ -o $@

%.ko: %.kasm
	kasm $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean