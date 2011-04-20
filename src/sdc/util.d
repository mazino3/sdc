/**
 * Copyright 2010 Bernard Helyer.
 * This file is part of SDC. SDC is licensed under the GPL.
 * See LICENCE or sdc.d for more details.
 */
module sdc.util;

import std.conv;
import std.stdio;
import std.string;

bool contains(T)(const(T)[] l, const T a)
{
    foreach (e; l) {
        if (e == a) {
            return true;
        }
    }
    return false;
}

void debugPrint(T...)(lazy string msg, T vs) 
{
    debug {
        write("DEBUG: ");
        writefln(msg, vs);
    }
}

void debugPrint(T)(T arg)
{
    debugPrint("%s", to!string(arg));
}

void dbga() { debugPrint("A"); }
void dbgb() { debugPrint("B"); }

enum Status : bool
{
    Failure,
    Success,
}

unittest
{
    auto fail = Status.Failure;
    auto success = Status.Success;
    assert(!fail);
    assert(success);
}

template MultiMixin(alias A, T...)
{
    static if (T.length) {
        mixin A!(T[0]);
        mixin MultiMixin!(A, T[1 .. $]);
    }
}
