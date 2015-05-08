CC=g++
#CFLAGS=-O3 -Wall
CFLAGS=-O0 -g -Wall
#LFLAGS=-lsystemc -lm
LFLAGS=-lsystemc

IDIR=/software/SystemC/systemc-2.2.0/include
LDIR=/software/SystemC/systemc-2.2.0/lib-linux64
#IDIR=/usr/local/systemc-2.2.0/include
#LDIR=/usr/local/systemc-2.2.0/lib-linux
#LDIR=/usr/local/systemc-2.2.0/lib-cygwin

SRCDIR=./src
OBJDIR=./obj
BINDIR=./bin
TBDIR=./tb

$(BINDIR)/tb_acs4 :: $(OBJDIR)/acs4.o $(OBJDIR)/starter.o \
		       $(OBJDIR)/data_gen.o $(OBJDIR)/data_writer.o \
		       $(OBJDIR)/tb_acs4.o 
	$(CC) $? -o $@ -L $(LDIR) $(LFLAGS)

$(OBJDIR)/tb_acs4.o :: $(TBDIR)/tb_acs4.cpp
	$(CC) $(CFLAGS) -c $? -o $@ -I $(IDIR) -I $(SRCDIR)

$(OBJDIR)/starter.o :: $(TBDIR)/starter.cpp
	$(CC) $(CFLAGS) -c $? -o $@ -I $(IDIR) -I $(SRCDIR)

$(OBJDIR)/data_gen.o :: $(TBDIR)/data_gen.cpp
	$(CC) $(CFLAGS) -c $? -o $@ -I $(IDIR) -I $(SRCDIR)

$(OBJDIR)/data_writer.o :: $(TBDIR)/data_writer.cpp
	$(CC) $(CFLAGS) -c $? -o $@ -I $(IDIR) -I $(SRCDIR)

$(OBJDIR)/acs4.o :: $(SRCDIR)/acs4.cpp
	$(CC) $(CFLAGS) -c $? -o $@ -I $(IDIR) -I $(SRCDIR)

clean ::
	rm -rf $(BINDIR)/* $(OBJDIR)/*
