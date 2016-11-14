; ModuleID = 'des-ob.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.key_set = type { [8 x i8], [4 x i8], [4 x i8] }

@initial_key_permutaion = global [56 x i32] [i32 57, i32 49, i32 41, i32 33, i32 25, i32 17, i32 9, i32 1, i32 58, i32 50, i32 42, i32 34, i32 26, i32 18, i32 10, i32 2, i32 59, i32 51, i32 43, i32 35, i32 27, i32 19, i32 11, i32 3, i32 60, i32 52, i32 44, i32 36, i32 63, i32 55, i32 47, i32 39, i32 31, i32 23, i32 15, i32 7, i32 62, i32 54, i32 46, i32 38, i32 30, i32 22, i32 14, i32 6, i32 61, i32 53, i32 45, i32 37, i32 29, i32 21, i32 13, i32 5, i32 28, i32 20, i32 12, i32 4], align 16
@initial_message_permutation = global [64 x i32] [i32 58, i32 50, i32 42, i32 34, i32 26, i32 18, i32 10, i32 2, i32 60, i32 52, i32 44, i32 36, i32 28, i32 20, i32 12, i32 4, i32 62, i32 54, i32 46, i32 38, i32 30, i32 22, i32 14, i32 6, i32 64, i32 56, i32 48, i32 40, i32 32, i32 24, i32 16, i32 8, i32 57, i32 49, i32 41, i32 33, i32 25, i32 17, i32 9, i32 1, i32 59, i32 51, i32 43, i32 35, i32 27, i32 19, i32 11, i32 3, i32 61, i32 53, i32 45, i32 37, i32 29, i32 21, i32 13, i32 5, i32 63, i32 55, i32 47, i32 39, i32 31, i32 23, i32 15, i32 7], align 16
@key_shift_sizes = global [17 x i32] [i32 -1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1], align 16
@sub_key_permutation = global [48 x i32] [i32 14, i32 17, i32 11, i32 24, i32 1, i32 5, i32 3, i32 28, i32 15, i32 6, i32 21, i32 10, i32 23, i32 19, i32 12, i32 4, i32 26, i32 8, i32 16, i32 7, i32 27, i32 20, i32 13, i32 2, i32 41, i32 52, i32 31, i32 37, i32 47, i32 55, i32 30, i32 40, i32 51, i32 45, i32 33, i32 48, i32 44, i32 49, i32 39, i32 56, i32 34, i32 53, i32 46, i32 42, i32 50, i32 36, i32 29, i32 32], align 16
@message_expansion = global [48 x i32] [i32 32, i32 1, i32 2, i32 3, i32 4, i32 5, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 28, i32 29, i32 30, i32 31, i32 32, i32 1], align 16
@S1 = global [64 x i32] [i32 14, i32 4, i32 13, i32 1, i32 2, i32 15, i32 11, i32 8, i32 3, i32 10, i32 6, i32 12, i32 5, i32 9, i32 0, i32 7, i32 0, i32 15, i32 7, i32 4, i32 14, i32 2, i32 13, i32 1, i32 10, i32 6, i32 12, i32 11, i32 9, i32 5, i32 3, i32 8, i32 4, i32 1, i32 14, i32 8, i32 13, i32 6, i32 2, i32 11, i32 15, i32 12, i32 9, i32 7, i32 3, i32 10, i32 5, i32 0, i32 15, i32 12, i32 8, i32 2, i32 4, i32 9, i32 1, i32 7, i32 5, i32 11, i32 3, i32 14, i32 10, i32 0, i32 6, i32 13], align 16
@S2 = global [64 x i32] [i32 15, i32 1, i32 8, i32 14, i32 6, i32 11, i32 3, i32 4, i32 9, i32 7, i32 2, i32 13, i32 12, i32 0, i32 5, i32 10, i32 3, i32 13, i32 4, i32 7, i32 15, i32 2, i32 8, i32 14, i32 12, i32 0, i32 1, i32 10, i32 6, i32 9, i32 11, i32 5, i32 0, i32 14, i32 7, i32 11, i32 10, i32 4, i32 13, i32 1, i32 5, i32 8, i32 12, i32 6, i32 9, i32 3, i32 2, i32 15, i32 13, i32 8, i32 10, i32 1, i32 3, i32 15, i32 4, i32 2, i32 11, i32 6, i32 7, i32 12, i32 0, i32 5, i32 14, i32 9], align 16
@S3 = global [64 x i32] [i32 10, i32 0, i32 9, i32 14, i32 6, i32 3, i32 15, i32 5, i32 1, i32 13, i32 12, i32 7, i32 11, i32 4, i32 2, i32 8, i32 13, i32 7, i32 0, i32 9, i32 3, i32 4, i32 6, i32 10, i32 2, i32 8, i32 5, i32 14, i32 12, i32 11, i32 15, i32 1, i32 13, i32 6, i32 4, i32 9, i32 8, i32 15, i32 3, i32 0, i32 11, i32 1, i32 2, i32 12, i32 5, i32 10, i32 14, i32 7, i32 1, i32 10, i32 13, i32 0, i32 6, i32 9, i32 8, i32 7, i32 4, i32 15, i32 14, i32 3, i32 11, i32 5, i32 2, i32 12], align 16
@S4 = global [64 x i32] [i32 7, i32 13, i32 14, i32 3, i32 0, i32 6, i32 9, i32 10, i32 1, i32 2, i32 8, i32 5, i32 11, i32 12, i32 4, i32 15, i32 13, i32 8, i32 11, i32 5, i32 6, i32 15, i32 0, i32 3, i32 4, i32 7, i32 2, i32 12, i32 1, i32 10, i32 14, i32 9, i32 10, i32 6, i32 9, i32 0, i32 12, i32 11, i32 7, i32 13, i32 15, i32 1, i32 3, i32 14, i32 5, i32 2, i32 8, i32 4, i32 3, i32 15, i32 0, i32 6, i32 10, i32 1, i32 13, i32 8, i32 9, i32 4, i32 5, i32 11, i32 12, i32 7, i32 2, i32 14], align 16
@S5 = global [64 x i32] [i32 2, i32 12, i32 4, i32 1, i32 7, i32 10, i32 11, i32 6, i32 8, i32 5, i32 3, i32 15, i32 13, i32 0, i32 14, i32 9, i32 14, i32 11, i32 2, i32 12, i32 4, i32 7, i32 13, i32 1, i32 5, i32 0, i32 15, i32 10, i32 3, i32 9, i32 8, i32 6, i32 4, i32 2, i32 1, i32 11, i32 10, i32 13, i32 7, i32 8, i32 15, i32 9, i32 12, i32 5, i32 6, i32 3, i32 0, i32 14, i32 11, i32 8, i32 12, i32 7, i32 1, i32 14, i32 2, i32 13, i32 6, i32 15, i32 0, i32 9, i32 10, i32 4, i32 5, i32 3], align 16
@S6 = global [64 x i32] [i32 12, i32 1, i32 10, i32 15, i32 9, i32 2, i32 6, i32 8, i32 0, i32 13, i32 3, i32 4, i32 14, i32 7, i32 5, i32 11, i32 10, i32 15, i32 4, i32 2, i32 7, i32 12, i32 9, i32 5, i32 6, i32 1, i32 13, i32 14, i32 0, i32 11, i32 3, i32 8, i32 9, i32 14, i32 15, i32 5, i32 2, i32 8, i32 12, i32 3, i32 7, i32 0, i32 4, i32 10, i32 1, i32 13, i32 11, i32 6, i32 4, i32 3, i32 2, i32 12, i32 9, i32 5, i32 15, i32 10, i32 11, i32 14, i32 1, i32 7, i32 6, i32 0, i32 8, i32 13], align 16
@S7 = global [64 x i32] [i32 4, i32 11, i32 2, i32 14, i32 15, i32 0, i32 8, i32 13, i32 3, i32 12, i32 9, i32 7, i32 5, i32 10, i32 6, i32 1, i32 13, i32 0, i32 11, i32 7, i32 4, i32 9, i32 1, i32 10, i32 14, i32 3, i32 5, i32 12, i32 2, i32 15, i32 8, i32 6, i32 1, i32 4, i32 11, i32 13, i32 12, i32 3, i32 7, i32 14, i32 10, i32 15, i32 6, i32 8, i32 0, i32 5, i32 9, i32 2, i32 6, i32 11, i32 13, i32 8, i32 1, i32 4, i32 10, i32 7, i32 9, i32 5, i32 0, i32 15, i32 14, i32 2, i32 3, i32 12], align 16
@S8 = global [64 x i32] [i32 13, i32 2, i32 8, i32 4, i32 6, i32 15, i32 11, i32 1, i32 10, i32 9, i32 3, i32 14, i32 5, i32 0, i32 12, i32 7, i32 1, i32 15, i32 13, i32 8, i32 10, i32 3, i32 7, i32 4, i32 12, i32 5, i32 6, i32 11, i32 0, i32 14, i32 9, i32 2, i32 7, i32 11, i32 4, i32 1, i32 9, i32 12, i32 14, i32 2, i32 0, i32 6, i32 10, i32 13, i32 15, i32 3, i32 5, i32 8, i32 2, i32 1, i32 14, i32 7, i32 4, i32 10, i32 8, i32 13, i32 15, i32 12, i32 9, i32 0, i32 3, i32 5, i32 6, i32 11], align 16
@right_sub_message_permutation = global [32 x i32] [i32 16, i32 7, i32 20, i32 21, i32 29, i32 12, i32 28, i32 17, i32 1, i32 15, i32 23, i32 26, i32 5, i32 18, i32 31, i32 10, i32 2, i32 8, i32 24, i32 14, i32 32, i32 27, i32 3, i32 9, i32 19, i32 13, i32 30, i32 6, i32 22, i32 11, i32 4, i32 25], align 16
@final_message_permutation = global [64 x i32] [i32 40, i32 8, i32 48, i32 16, i32 56, i32 24, i32 64, i32 32, i32 39, i32 7, i32 47, i32 15, i32 55, i32 23, i32 63, i32 31, i32 38, i32 6, i32 46, i32 14, i32 54, i32 22, i32 62, i32 30, i32 37, i32 5, i32 45, i32 13, i32 53, i32 21, i32 61, i32 29, i32 36, i32 4, i32 44, i32 12, i32 52, i32 20, i32 60, i32 28, i32 35, i32 3, i32 43, i32 11, i32 51, i32 19, i32 59, i32 27, i32 34, i32 2, i32 42, i32 10, i32 50, i32 18, i32 58, i32 26, i32 33, i32 1, i32 41, i32 9, i32 49, i32 17, i32 57, i32 25], align 16
@.str = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"K: \0A\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"%02X : \00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"\0AC: \0A\00", align 1
@.str6 = private unnamed_addr constant [6 x i8] c"\0AD: \0A\00", align 1

; Function Attrs: nounwind uwtable
define void @print_char_as_binary(i8 signext %input) #0 {
  %1 = alloca i8, align 1
  %i = alloca i32, align 4
  %shift_byte = alloca i8, align 1
  store i8 %input, i8* %1, align 1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %34, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %41

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sub i32 0, %6
  %8 = xor i32 7, %7
  %9 = and i32 7, %7
  %10 = add i32 %9, %9
  %11 = add nsw i32 %8, %10
  %12 = sub nsw i32 7, %6
  %13 = shl i32 1, %11
  %14 = trunc i32 %13 to i8
  store i8 %14, i8* %shift_byte, align 1
  %15 = load i8* %shift_byte, align 1
  %16 = sext i8 %15 to i32
  %17 = load i8* %1, align 1
  %18 = sext i8 %17 to i32
  %19 = xor i32 -537458642, -1
  %20 = or i32 %16, -537458642
  %21 = or i32 %18, -537458642
  %22 = or i32 %16, %19
  %23 = or i32 %18, %19
  %24 = and i32 %20, %21
  %25 = and i32 %24, %22
  %26 = and i32 %25, %23
  %27 = and i32 %16, %18
  %28 = icmp ne i32 %26, 0
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %5
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  br label %33

; <label>:31                                      ; preds = %5
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  br label %33

; <label>:33                                      ; preds = %31, %29
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32* %i, align 4
  %36 = xor i32 %35, 1
  %37 = and i32 %35, 1
  %38 = add i32 %37, %37
  %39 = add nsw i32 %36, %38
  %40 = add nsw i32 %35, 1
  store i32 %39, i32* %i, align 4
  br label %2

; <label>:41                                      ; preds = %2
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @generate_key(i8* %key) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %key, i8** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %13, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %20

; <label>:5                                       ; preds = %2
  %6 = call i32 @rand() #3
  %7 = srem i32 %6, 255
  %8 = trunc i32 %7 to i8
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load i8** %1, align 8
  %12 = getelementptr inbounds i8* %11, i64 %10
  store i8 %8, i8* %12, align 1
  br label %13

; <label>:13                                      ; preds = %5
  %14 = load i32* %i, align 4
  %15 = xor i32 %14, 1
  %16 = and i32 %14, 1
  %17 = add i32 %16, %16
  %18 = add nsw i32 %15, %17
  %19 = add nsw i32 %14, 1
  store i32 %18, i32* %i, align 4
  br label %2

; <label>:20                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind uwtable
define void @print_key_set(i64 %key_set.coerce0, i64 %key_set.coerce1) #0 {
  %key_set = alloca %struct.key_set, align 8
  %i = alloca i32, align 4
  %1 = bitcast %struct.key_set* %key_set to { i64, i64 }*
  %2 = getelementptr { i64, i64 }* %1, i32 0, i32 0
  store i64 %key_set.coerce0, i64* %2
  %3 = getelementptr { i64, i64 }* %1, i32 0, i32 1
  store i64 %key_set.coerce1, i64* %3
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %22, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %29

; <label>:8                                       ; preds = %5
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 0
  %12 = getelementptr inbounds [8 x i8]* %11, i32 0, i64 %10
  %13 = load i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %14)
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 0
  %19 = getelementptr inbounds [8 x i8]* %18, i32 0, i64 %17
  %20 = load i8* %19, align 1
  call void @print_char_as_binary(i8 signext %20)
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %8
  %23 = load i32* %i, align 4
  %24 = xor i32 %23, 1
  %25 = and i32 %23, 1
  %26 = add i32 %25, %25
  %27 = add nsw i32 %24, %26
  %28 = add nsw i32 %23, 1
  store i32 %27, i32* %i, align 4
  br label %5

; <label>:29                                      ; preds = %5
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %31

; <label>:31                                      ; preds = %48, %29
  %32 = load i32* %i, align 4
  %33 = icmp slt i32 %32, 4
  br i1 %33, label %34, label %55

; <label>:34                                      ; preds = %31
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 1
  %38 = getelementptr inbounds [4 x i8]* %37, i32 0, i64 %36
  %39 = load i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %40)
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 1
  %45 = getelementptr inbounds [4 x i8]* %44, i32 0, i64 %43
  %46 = load i8* %45, align 1
  call void @print_char_as_binary(i8 signext %46)
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %48

; <label>:48                                      ; preds = %34
  %49 = load i32* %i, align 4
  %50 = xor i32 %49, 1
  %51 = and i32 %49, 1
  %52 = add i32 %51, %51
  %53 = add nsw i32 %50, %52
  %54 = add nsw i32 %49, 1
  store i32 %53, i32* %i, align 4
  br label %31

; <label>:55                                      ; preds = %31
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str6, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %57

; <label>:57                                      ; preds = %74, %55
  %58 = load i32* %i, align 4
  %59 = icmp slt i32 %58, 4
  br i1 %59, label %60, label %81

; <label>:60                                      ; preds = %57
  %61 = load i32* %i, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 2
  %64 = getelementptr inbounds [4 x i8]* %63, i32 0, i64 %62
  %65 = load i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %66)
  %68 = load i32* %i, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds %struct.key_set* %key_set, i32 0, i32 2
  %71 = getelementptr inbounds [4 x i8]* %70, i32 0, i64 %69
  %72 = load i8* %71, align 1
  call void @print_char_as_binary(i8 signext %72)
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  br label %74

; <label>:74                                      ; preds = %60
  %75 = load i32* %i, align 4
  %76 = xor i32 %75, 1
  %77 = and i32 %75, 1
  %78 = add i32 %77, %77
  %79 = add nsw i32 %76, %78
  %80 = add nsw i32 %75, 1
  store i32 %79, i32* %i, align 4
  br label %57

; <label>:81                                      ; preds = %57
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define void @generate_sub_keys(i8* %main_key, %struct.key_set* %key_sets) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.key_set*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %shift_size = alloca i32, align 4
  %shift_byte = alloca i8, align 1
  %first_shift_bits = alloca i8, align 1
  %second_shift_bits = alloca i8, align 1
  %third_shift_bits = alloca i8, align 1
  %fourth_shift_bits = alloca i8, align 1
  store i8* %main_key, i8** %1, align 8
  store %struct.key_set* %key_sets, %struct.key_set** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 8
  br i1 %5, label %6, label %20

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = load %struct.key_set** %2, align 8
  %10 = getelementptr inbounds %struct.key_set* %9, i64 0
  %11 = getelementptr inbounds %struct.key_set* %10, i32 0, i32 0
  %12 = getelementptr inbounds [8 x i8]* %11, i32 0, i64 %8
  store i8 0, i8* %12, align 1
  br label %13

; <label>:13                                      ; preds = %6
  %14 = load i32* %i, align 4
  %15 = xor i32 %14, 1
  %16 = and i32 %14, 1
  %17 = add i32 %16, %16
  %18 = add nsw i32 %15, %17
  %19 = add nsw i32 %14, 1
  store i32 %18, i32* %i, align 4
  br label %3

; <label>:20                                      ; preds = %3
  store i32 0, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %95, %20
  %22 = load i32* %i, align 4
  %23 = icmp slt i32 %22, 56
  br i1 %23, label %24, label %102

; <label>:24                                      ; preds = %21
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [56 x i32]* @initial_key_permutaion, i32 0, i64 %26
  %28 = load i32* %27, align 4
  store i32 %28, i32* %shift_size, align 4
  %29 = load i32* %shift_size, align 4
  %30 = sub i32 0, 1
  %31 = xor i32 %29, %30
  %32 = and i32 %29, %30
  %33 = add i32 %32, %32
  %34 = add nsw i32 %31, %33
  %35 = sub nsw i32 %29, 1
  %36 = srem i32 %34, 8
  %37 = ashr i32 128, %36
  %38 = trunc i32 %37 to i8
  store i8 %38, i8* %shift_byte, align 1
  %39 = load i32* %shift_size, align 4
  %40 = sub i32 0, 1
  %41 = xor i32 %39, %40
  %42 = and i32 %39, %40
  %43 = add i32 %42, %42
  %44 = add nsw i32 %41, %43
  %45 = sub nsw i32 %39, 1
  %46 = sdiv i32 %44, 8
  %47 = sext i32 %46 to i64
  %48 = load i8** %1, align 8
  %49 = getelementptr inbounds i8* %48, i64 %47
  %50 = load i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = load i8* %shift_byte, align 1
  %53 = zext i8 %52 to i32
  %54 = xor i32 1486915360, -1
  %55 = or i32 %53, 1486915360
  %56 = or i32 %51, 1486915360
  %57 = or i32 %53, %54
  %58 = or i32 %51, %54
  %59 = and i32 %55, %56
  %60 = and i32 %59, %57
  %61 = and i32 %60, %58
  %62 = and i32 %53, %51
  %63 = trunc i32 %61 to i8
  store i8 %63, i8* %shift_byte, align 1
  %64 = load i32* %shift_size, align 4
  %65 = sub i32 0, 1
  %66 = xor i32 %64, %65
  %67 = and i32 %64, %65
  %68 = add i32 %67, %67
  %69 = add nsw i32 %66, %68
  %70 = sub nsw i32 %64, 1
  %71 = srem i32 %69, 8
  %72 = load i8* %shift_byte, align 1
  %73 = zext i8 %72 to i32
  %74 = shl i32 %73, %71
  %75 = trunc i32 %74 to i8
  store i8 %75, i8* %shift_byte, align 1
  %76 = load i8* %shift_byte, align 1
  %77 = zext i8 %76 to i32
  %78 = load i32* %i, align 4
  %79 = srem i32 %78, 8
  %80 = ashr i32 %77, %79
  %81 = load i32* %i, align 4
  %82 = sdiv i32 %81, 8
  %83 = sext i32 %82 to i64
  %84 = load %struct.key_set** %2, align 8
  %85 = getelementptr inbounds %struct.key_set* %84, i64 0
  %86 = getelementptr inbounds %struct.key_set* %85, i32 0, i32 0
  %87 = getelementptr inbounds [8 x i8]* %86, i32 0, i64 %83
  %88 = load i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = and i32 %89, %80
  %91 = xor i32 %89, %80
  %92 = or i32 %90, %91
  %93 = or i32 %89, %80
  %94 = trunc i32 %92 to i8
  store i8 %94, i8* %87, align 1
  br label %95

; <label>:95                                      ; preds = %24
  %96 = load i32* %i, align 4
  %97 = xor i32 %96, 1
  %98 = and i32 %96, 1
  %99 = add i32 %98, %98
  %100 = add nsw i32 %97, %99
  %101 = add nsw i32 %96, 1
  store i32 %100, i32* %i, align 4
  br label %21

; <label>:102                                     ; preds = %21
  store i32 0, i32* %i, align 4
  br label %103

; <label>:103                                     ; preds = %120, %102
  %104 = load i32* %i, align 4
  %105 = icmp slt i32 %104, 3
  br i1 %105, label %106, label %127

; <label>:106                                     ; preds = %103
  %107 = load i32* %i, align 4
  %108 = sext i32 %107 to i64
  %109 = load %struct.key_set** %2, align 8
  %110 = getelementptr inbounds %struct.key_set* %109, i64 0
  %111 = getelementptr inbounds %struct.key_set* %110, i32 0, i32 0
  %112 = getelementptr inbounds [8 x i8]* %111, i32 0, i64 %108
  %113 = load i8* %112, align 1
  %114 = load i32* %i, align 4
  %115 = sext i32 %114 to i64
  %116 = load %struct.key_set** %2, align 8
  %117 = getelementptr inbounds %struct.key_set* %116, i64 0
  %118 = getelementptr inbounds %struct.key_set* %117, i32 0, i32 1
  %119 = getelementptr inbounds [4 x i8]* %118, i32 0, i64 %115
  store i8 %113, i8* %119, align 1
  br label %120

; <label>:120                                     ; preds = %106
  %121 = load i32* %i, align 4
  %122 = xor i32 %121, 1
  %123 = and i32 %121, 1
  %124 = add i32 %123, %123
  %125 = add nsw i32 %122, %124
  %126 = add nsw i32 %121, 1
  store i32 %125, i32* %i, align 4
  br label %103

; <label>:127                                     ; preds = %103
  %128 = load %struct.key_set** %2, align 8
  %129 = getelementptr inbounds %struct.key_set* %128, i64 0
  %130 = getelementptr inbounds %struct.key_set* %129, i32 0, i32 0
  %131 = getelementptr inbounds [8 x i8]* %130, i32 0, i64 3
  %132 = load i8* %131, align 1
  %133 = zext i8 %132 to i32
  %134 = xor i32 736974309, -1
  %135 = or i32 %133, 736974309
  %136 = or i32 240, 736974309
  %137 = or i32 %133, %134
  %138 = or i32 240, %134
  %139 = and i32 %135, %136
  %140 = and i32 %139, %137
  %141 = and i32 %140, %138
  %142 = and i32 %133, 240
  %143 = trunc i32 %141 to i8
  %144 = load %struct.key_set** %2, align 8
  %145 = getelementptr inbounds %struct.key_set* %144, i64 0
  %146 = getelementptr inbounds %struct.key_set* %145, i32 0, i32 1
  %147 = getelementptr inbounds [4 x i8]* %146, i32 0, i64 3
  store i8 %143, i8* %147, align 1
  store i32 0, i32* %i, align 4
  br label %148

; <label>:148                                     ; preds = %218, %127
  %149 = load i32* %i, align 4
  %150 = icmp slt i32 %149, 3
  br i1 %150, label %151, label %225

; <label>:151                                     ; preds = %148
  %152 = load i32* %i, align 4
  %153 = xor i32 %152, 3
  %154 = and i32 %152, 3
  %155 = add i32 %154, %154
  %156 = add nsw i32 %153, %155
  %157 = add nsw i32 %152, 3
  %158 = sext i32 %156 to i64
  %159 = load %struct.key_set** %2, align 8
  %160 = getelementptr inbounds %struct.key_set* %159, i64 0
  %161 = getelementptr inbounds %struct.key_set* %160, i32 0, i32 0
  %162 = getelementptr inbounds [8 x i8]* %161, i32 0, i64 %158
  %163 = load i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = xor i32 -760474680, -1
  %166 = or i32 %164, -760474680
  %167 = or i32 15, -760474680
  %168 = or i32 %164, %165
  %169 = or i32 15, %165
  %170 = and i32 %166, %167
  %171 = and i32 %170, %168
  %172 = and i32 %171, %169
  %173 = and i32 %164, 15
  %174 = shl i32 %172, 4
  %175 = trunc i32 %174 to i8
  %176 = load i32* %i, align 4
  %177 = sext i32 %176 to i64
  %178 = load %struct.key_set** %2, align 8
  %179 = getelementptr inbounds %struct.key_set* %178, i64 0
  %180 = getelementptr inbounds %struct.key_set* %179, i32 0, i32 2
  %181 = getelementptr inbounds [4 x i8]* %180, i32 0, i64 %177
  store i8 %175, i8* %181, align 1
  %182 = load i32* %i, align 4
  %183 = xor i32 %182, 4
  %184 = and i32 %182, 4
  %185 = add i32 %184, %184
  %186 = add nsw i32 %183, %185
  %187 = add nsw i32 %182, 4
  %188 = sext i32 %186 to i64
  %189 = load %struct.key_set** %2, align 8
  %190 = getelementptr inbounds %struct.key_set* %189, i64 0
  %191 = getelementptr inbounds %struct.key_set* %190, i32 0, i32 0
  %192 = getelementptr inbounds [8 x i8]* %191, i32 0, i64 %188
  %193 = load i8* %192, align 1
  %194 = zext i8 %193 to i32
  %195 = xor i32 286989919, -1
  %196 = or i32 %194, 286989919
  %197 = or i32 240, 286989919
  %198 = or i32 %194, %195
  %199 = or i32 240, %195
  %200 = and i32 %196, %197
  %201 = and i32 %200, %198
  %202 = and i32 %201, %199
  %203 = and i32 %194, 240
  %204 = ashr i32 %202, 4
  %205 = load i32* %i, align 4
  %206 = sext i32 %205 to i64
  %207 = load %struct.key_set** %2, align 8
  %208 = getelementptr inbounds %struct.key_set* %207, i64 0
  %209 = getelementptr inbounds %struct.key_set* %208, i32 0, i32 2
  %210 = getelementptr inbounds [4 x i8]* %209, i32 0, i64 %206
  %211 = load i8* %210, align 1
  %212 = zext i8 %211 to i32
  %213 = and i32 %212, %204
  %214 = xor i32 %212, %204
  %215 = or i32 %213, %214
  %216 = or i32 %212, %204
  %217 = trunc i32 %215 to i8
  store i8 %217, i8* %210, align 1
  br label %218

; <label>:218                                     ; preds = %151
  %219 = load i32* %i, align 4
  %220 = xor i32 %219, 1
  %221 = and i32 %219, 1
  %222 = add i32 %221, %221
  %223 = add nsw i32 %220, %222
  %224 = add nsw i32 %219, 1
  store i32 %223, i32* %i, align 4
  br label %148

; <label>:225                                     ; preds = %148
  %226 = load %struct.key_set** %2, align 8
  %227 = getelementptr inbounds %struct.key_set* %226, i64 0
  %228 = getelementptr inbounds %struct.key_set* %227, i32 0, i32 0
  %229 = getelementptr inbounds [8 x i8]* %228, i32 0, i64 6
  %230 = load i8* %229, align 1
  %231 = zext i8 %230 to i32
  %232 = xor i32 -530302757, -1
  %233 = or i32 %231, -530302757
  %234 = or i32 15, -530302757
  %235 = or i32 %231, %232
  %236 = or i32 15, %232
  %237 = and i32 %233, %234
  %238 = and i32 %237, %235
  %239 = and i32 %238, %236
  %240 = and i32 %231, 15
  %241 = shl i32 %239, 4
  %242 = trunc i32 %241 to i8
  %243 = load %struct.key_set** %2, align 8
  %244 = getelementptr inbounds %struct.key_set* %243, i64 0
  %245 = getelementptr inbounds %struct.key_set* %244, i32 0, i32 2
  %246 = getelementptr inbounds [4 x i8]* %245, i32 0, i64 3
  store i8 %242, i8* %246, align 1
  store i32 1, i32* %i, align 4
  br label %247

; <label>:247                                     ; preds = %918, %225
  %248 = load i32* %i, align 4
  %249 = icmp slt i32 %248, 17
  br i1 %249, label %250, label %925

; <label>:250                                     ; preds = %247
  store i32 0, i32* %j, align 4
  br label %251

; <label>:251                                     ; preds = %301, %250
  %252 = load i32* %j, align 4
  %253 = icmp slt i32 %252, 4
  br i1 %253, label %254, label %308

; <label>:254                                     ; preds = %251
  %255 = load i32* %j, align 4
  %256 = sext i32 %255 to i64
  %257 = load i32* %i, align 4
  %258 = sub i32 0, 1
  %259 = xor i32 %257, %258
  %260 = and i32 %257, %258
  %261 = add i32 %260, %260
  %262 = add nsw i32 %259, %261
  %263 = sub nsw i32 %257, 1
  %264 = sext i32 %262 to i64
  %265 = load %struct.key_set** %2, align 8
  %266 = getelementptr inbounds %struct.key_set* %265, i64 %264
  %267 = getelementptr inbounds %struct.key_set* %266, i32 0, i32 1
  %268 = getelementptr inbounds [4 x i8]* %267, i32 0, i64 %256
  %269 = load i8* %268, align 1
  %270 = load i32* %j, align 4
  %271 = sext i32 %270 to i64
  %272 = load i32* %i, align 4
  %273 = sext i32 %272 to i64
  %274 = load %struct.key_set** %2, align 8
  %275 = getelementptr inbounds %struct.key_set* %274, i64 %273
  %276 = getelementptr inbounds %struct.key_set* %275, i32 0, i32 1
  %277 = getelementptr inbounds [4 x i8]* %276, i32 0, i64 %271
  store i8 %269, i8* %277, align 1
  %278 = load i32* %j, align 4
  %279 = sext i32 %278 to i64
  %280 = load i32* %i, align 4
  %281 = sub i32 0, 1
  %282 = xor i32 %280, %281
  %283 = and i32 %280, %281
  %284 = add i32 %283, %283
  %285 = add nsw i32 %282, %284
  %286 = sub nsw i32 %280, 1
  %287 = sext i32 %285 to i64
  %288 = load %struct.key_set** %2, align 8
  %289 = getelementptr inbounds %struct.key_set* %288, i64 %287
  %290 = getelementptr inbounds %struct.key_set* %289, i32 0, i32 2
  %291 = getelementptr inbounds [4 x i8]* %290, i32 0, i64 %279
  %292 = load i8* %291, align 1
  %293 = load i32* %j, align 4
  %294 = sext i32 %293 to i64
  %295 = load i32* %i, align 4
  %296 = sext i32 %295 to i64
  %297 = load %struct.key_set** %2, align 8
  %298 = getelementptr inbounds %struct.key_set* %297, i64 %296
  %299 = getelementptr inbounds %struct.key_set* %298, i32 0, i32 2
  %300 = getelementptr inbounds [4 x i8]* %299, i32 0, i64 %294
  store i8 %292, i8* %300, align 1
  br label %301

; <label>:301                                     ; preds = %254
  %302 = load i32* %j, align 4
  %303 = xor i32 %302, 1
  %304 = and i32 %302, 1
  %305 = add i32 %304, %304
  %306 = add nsw i32 %303, %305
  %307 = add nsw i32 %302, 1
  store i32 %306, i32* %j, align 4
  br label %251

; <label>:308                                     ; preds = %251
  %309 = load i32* %i, align 4
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [17 x i32]* @key_shift_sizes, i32 0, i64 %310
  %312 = load i32* %311, align 4
  store i32 %312, i32* %shift_size, align 4
  %313 = load i32* %shift_size, align 4
  %314 = icmp eq i32 %313, 1
  br i1 %314, label %315, label %316

; <label>:315                                     ; preds = %308
  store i8 -128, i8* %shift_byte, align 1
  br label %317

; <label>:316                                     ; preds = %308
  store i8 -64, i8* %shift_byte, align 1
  br label %317

; <label>:317                                     ; preds = %316, %315
  %318 = load i8* %shift_byte, align 1
  %319 = zext i8 %318 to i32
  %320 = load i32* %i, align 4
  %321 = sext i32 %320 to i64
  %322 = load %struct.key_set** %2, align 8
  %323 = getelementptr inbounds %struct.key_set* %322, i64 %321
  %324 = getelementptr inbounds %struct.key_set* %323, i32 0, i32 1
  %325 = getelementptr inbounds [4 x i8]* %324, i32 0, i64 0
  %326 = load i8* %325, align 1
  %327 = zext i8 %326 to i32
  %328 = xor i32 -303747048, -1
  %329 = or i32 %319, -303747048
  %330 = or i32 %327, -303747048
  %331 = or i32 %319, %328
  %332 = or i32 %327, %328
  %333 = and i32 %329, %330
  %334 = and i32 %333, %331
  %335 = and i32 %334, %332
  %336 = and i32 %319, %327
  %337 = trunc i32 %335 to i8
  store i8 %337, i8* %first_shift_bits, align 1
  %338 = load i8* %shift_byte, align 1
  %339 = zext i8 %338 to i32
  %340 = load i32* %i, align 4
  %341 = sext i32 %340 to i64
  %342 = load %struct.key_set** %2, align 8
  %343 = getelementptr inbounds %struct.key_set* %342, i64 %341
  %344 = getelementptr inbounds %struct.key_set* %343, i32 0, i32 1
  %345 = getelementptr inbounds [4 x i8]* %344, i32 0, i64 1
  %346 = load i8* %345, align 1
  %347 = zext i8 %346 to i32
  %348 = xor i32 -1771121269, -1
  %349 = or i32 %339, -1771121269
  %350 = or i32 %347, -1771121269
  %351 = or i32 %339, %348
  %352 = or i32 %347, %348
  %353 = and i32 %349, %350
  %354 = and i32 %353, %351
  %355 = and i32 %354, %352
  %356 = and i32 %339, %347
  %357 = trunc i32 %355 to i8
  store i8 %357, i8* %second_shift_bits, align 1
  %358 = load i8* %shift_byte, align 1
  %359 = zext i8 %358 to i32
  %360 = load i32* %i, align 4
  %361 = sext i32 %360 to i64
  %362 = load %struct.key_set** %2, align 8
  %363 = getelementptr inbounds %struct.key_set* %362, i64 %361
  %364 = getelementptr inbounds %struct.key_set* %363, i32 0, i32 1
  %365 = getelementptr inbounds [4 x i8]* %364, i32 0, i64 2
  %366 = load i8* %365, align 1
  %367 = zext i8 %366 to i32
  %368 = xor i32 -47343508, -1
  %369 = or i32 %359, -47343508
  %370 = or i32 %367, -47343508
  %371 = or i32 %359, %368
  %372 = or i32 %367, %368
  %373 = and i32 %369, %370
  %374 = and i32 %373, %371
  %375 = and i32 %374, %372
  %376 = and i32 %359, %367
  %377 = trunc i32 %375 to i8
  store i8 %377, i8* %third_shift_bits, align 1
  %378 = load i8* %shift_byte, align 1
  %379 = zext i8 %378 to i32
  %380 = load i32* %i, align 4
  %381 = sext i32 %380 to i64
  %382 = load %struct.key_set** %2, align 8
  %383 = getelementptr inbounds %struct.key_set* %382, i64 %381
  %384 = getelementptr inbounds %struct.key_set* %383, i32 0, i32 1
  %385 = getelementptr inbounds [4 x i8]* %384, i32 0, i64 3
  %386 = load i8* %385, align 1
  %387 = zext i8 %386 to i32
  %388 = xor i32 1940967845, -1
  %389 = or i32 %379, 1940967845
  %390 = or i32 %387, 1940967845
  %391 = or i32 %379, %388
  %392 = or i32 %387, %388
  %393 = and i32 %389, %390
  %394 = and i32 %393, %391
  %395 = and i32 %394, %392
  %396 = and i32 %379, %387
  %397 = trunc i32 %395 to i8
  store i8 %397, i8* %fourth_shift_bits, align 1
  %398 = load i32* %shift_size, align 4
  %399 = load i32* %i, align 4
  %400 = sext i32 %399 to i64
  %401 = load %struct.key_set** %2, align 8
  %402 = getelementptr inbounds %struct.key_set* %401, i64 %400
  %403 = getelementptr inbounds %struct.key_set* %402, i32 0, i32 1
  %404 = getelementptr inbounds [4 x i8]* %403, i32 0, i64 0
  %405 = load i8* %404, align 1
  %406 = zext i8 %405 to i32
  %407 = shl i32 %406, %398
  %408 = trunc i32 %407 to i8
  store i8 %408, i8* %404, align 1
  %409 = load i8* %second_shift_bits, align 1
  %410 = zext i8 %409 to i32
  %411 = load i32* %shift_size, align 4
  %412 = sub i32 0, %411
  %413 = xor i32 8, %412
  %414 = and i32 8, %412
  %415 = add i32 %414, %414
  %416 = add nsw i32 %413, %415
  %417 = sub nsw i32 8, %411
  %418 = ashr i32 %410, %416
  %419 = load i32* %i, align 4
  %420 = sext i32 %419 to i64
  %421 = load %struct.key_set** %2, align 8
  %422 = getelementptr inbounds %struct.key_set* %421, i64 %420
  %423 = getelementptr inbounds %struct.key_set* %422, i32 0, i32 1
  %424 = getelementptr inbounds [4 x i8]* %423, i32 0, i64 0
  %425 = load i8* %424, align 1
  %426 = zext i8 %425 to i32
  %427 = xor i32 %426, -1
  %428 = xor i32 %418, -1
  %429 = xor i32 1519050242, -1
  %430 = and i32 %427, 1519050242
  %431 = and i32 %426, %429
  %432 = and i32 %428, 1519050242
  %433 = and i32 %418, %429
  %434 = or i32 %430, %431
  %435 = or i32 %432, %433
  %436 = xor i32 %434, %435
  %437 = or i32 %427, %428
  %438 = xor i32 %437, -1
  %439 = or i32 1519050242, %429
  %440 = and i32 %438, %439
  %441 = or i32 %436, %440
  %442 = or i32 %426, %418
  %443 = trunc i32 %441 to i8
  store i8 %443, i8* %424, align 1
  %444 = load i32* %shift_size, align 4
  %445 = load i32* %i, align 4
  %446 = sext i32 %445 to i64
  %447 = load %struct.key_set** %2, align 8
  %448 = getelementptr inbounds %struct.key_set* %447, i64 %446
  %449 = getelementptr inbounds %struct.key_set* %448, i32 0, i32 1
  %450 = getelementptr inbounds [4 x i8]* %449, i32 0, i64 1
  %451 = load i8* %450, align 1
  %452 = zext i8 %451 to i32
  %453 = shl i32 %452, %444
  %454 = trunc i32 %453 to i8
  store i8 %454, i8* %450, align 1
  %455 = load i8* %third_shift_bits, align 1
  %456 = zext i8 %455 to i32
  %457 = load i32* %shift_size, align 4
  %458 = sub i32 0, %457
  %459 = xor i32 8, %458
  %460 = and i32 8, %458
  %461 = add i32 %460, %460
  %462 = add nsw i32 %459, %461
  %463 = sub nsw i32 8, %457
  %464 = ashr i32 %456, %462
  %465 = load i32* %i, align 4
  %466 = sext i32 %465 to i64
  %467 = load %struct.key_set** %2, align 8
  %468 = getelementptr inbounds %struct.key_set* %467, i64 %466
  %469 = getelementptr inbounds %struct.key_set* %468, i32 0, i32 1
  %470 = getelementptr inbounds [4 x i8]* %469, i32 0, i64 1
  %471 = load i8* %470, align 1
  %472 = zext i8 %471 to i32
  %473 = and i32 %472, %464
  %474 = xor i32 %472, %464
  %475 = or i32 %473, %474
  %476 = or i32 %472, %464
  %477 = trunc i32 %475 to i8
  store i8 %477, i8* %470, align 1
  %478 = load i32* %shift_size, align 4
  %479 = load i32* %i, align 4
  %480 = sext i32 %479 to i64
  %481 = load %struct.key_set** %2, align 8
  %482 = getelementptr inbounds %struct.key_set* %481, i64 %480
  %483 = getelementptr inbounds %struct.key_set* %482, i32 0, i32 1
  %484 = getelementptr inbounds [4 x i8]* %483, i32 0, i64 2
  %485 = load i8* %484, align 1
  %486 = zext i8 %485 to i32
  %487 = shl i32 %486, %478
  %488 = trunc i32 %487 to i8
  store i8 %488, i8* %484, align 1
  %489 = load i8* %fourth_shift_bits, align 1
  %490 = zext i8 %489 to i32
  %491 = load i32* %shift_size, align 4
  %492 = sub i32 0, %491
  %493 = xor i32 8, %492
  %494 = and i32 8, %492
  %495 = add i32 %494, %494
  %496 = add nsw i32 %493, %495
  %497 = sub nsw i32 8, %491
  %498 = ashr i32 %490, %496
  %499 = load i32* %i, align 4
  %500 = sext i32 %499 to i64
  %501 = load %struct.key_set** %2, align 8
  %502 = getelementptr inbounds %struct.key_set* %501, i64 %500
  %503 = getelementptr inbounds %struct.key_set* %502, i32 0, i32 1
  %504 = getelementptr inbounds [4 x i8]* %503, i32 0, i64 2
  %505 = load i8* %504, align 1
  %506 = zext i8 %505 to i32
  %507 = and i32 %506, %498
  %508 = xor i32 %506, %498
  %509 = or i32 %507, %508
  %510 = or i32 %506, %498
  %511 = trunc i32 %509 to i8
  store i8 %511, i8* %504, align 1
  %512 = load i32* %shift_size, align 4
  %513 = load i32* %i, align 4
  %514 = sext i32 %513 to i64
  %515 = load %struct.key_set** %2, align 8
  %516 = getelementptr inbounds %struct.key_set* %515, i64 %514
  %517 = getelementptr inbounds %struct.key_set* %516, i32 0, i32 1
  %518 = getelementptr inbounds [4 x i8]* %517, i32 0, i64 3
  %519 = load i8* %518, align 1
  %520 = zext i8 %519 to i32
  %521 = shl i32 %520, %512
  %522 = trunc i32 %521 to i8
  store i8 %522, i8* %518, align 1
  %523 = load i8* %first_shift_bits, align 1
  %524 = zext i8 %523 to i32
  %525 = load i32* %shift_size, align 4
  %526 = sub i32 0, %525
  %527 = xor i32 4, %526
  %528 = and i32 4, %526
  %529 = add i32 %528, %528
  %530 = add nsw i32 %527, %529
  %531 = sub nsw i32 4, %525
  %532 = ashr i32 %524, %530
  %533 = load i32* %i, align 4
  %534 = sext i32 %533 to i64
  %535 = load %struct.key_set** %2, align 8
  %536 = getelementptr inbounds %struct.key_set* %535, i64 %534
  %537 = getelementptr inbounds %struct.key_set* %536, i32 0, i32 1
  %538 = getelementptr inbounds [4 x i8]* %537, i32 0, i64 3
  %539 = load i8* %538, align 1
  %540 = zext i8 %539 to i32
  %541 = and i32 %540, %532
  %542 = xor i32 %540, %532
  %543 = or i32 %541, %542
  %544 = or i32 %540, %532
  %545 = trunc i32 %543 to i8
  store i8 %545, i8* %538, align 1
  %546 = load i8* %shift_byte, align 1
  %547 = zext i8 %546 to i32
  %548 = load i32* %i, align 4
  %549 = sext i32 %548 to i64
  %550 = load %struct.key_set** %2, align 8
  %551 = getelementptr inbounds %struct.key_set* %550, i64 %549
  %552 = getelementptr inbounds %struct.key_set* %551, i32 0, i32 2
  %553 = getelementptr inbounds [4 x i8]* %552, i32 0, i64 0
  %554 = load i8* %553, align 1
  %555 = zext i8 %554 to i32
  %556 = xor i32 1201579004, -1
  %557 = or i32 %547, 1201579004
  %558 = or i32 %555, 1201579004
  %559 = or i32 %547, %556
  %560 = or i32 %555, %556
  %561 = and i32 %557, %558
  %562 = and i32 %561, %559
  %563 = and i32 %562, %560
  %564 = and i32 %547, %555
  %565 = trunc i32 %563 to i8
  store i8 %565, i8* %first_shift_bits, align 1
  %566 = load i8* %shift_byte, align 1
  %567 = zext i8 %566 to i32
  %568 = load i32* %i, align 4
  %569 = sext i32 %568 to i64
  %570 = load %struct.key_set** %2, align 8
  %571 = getelementptr inbounds %struct.key_set* %570, i64 %569
  %572 = getelementptr inbounds %struct.key_set* %571, i32 0, i32 2
  %573 = getelementptr inbounds [4 x i8]* %572, i32 0, i64 1
  %574 = load i8* %573, align 1
  %575 = zext i8 %574 to i32
  %576 = xor i32 -906251394, -1
  %577 = or i32 %567, -906251394
  %578 = or i32 %575, -906251394
  %579 = or i32 %567, %576
  %580 = or i32 %575, %576
  %581 = and i32 %577, %578
  %582 = and i32 %581, %579
  %583 = and i32 %582, %580
  %584 = and i32 %567, %575
  %585 = trunc i32 %583 to i8
  store i8 %585, i8* %second_shift_bits, align 1
  %586 = load i8* %shift_byte, align 1
  %587 = zext i8 %586 to i32
  %588 = load i32* %i, align 4
  %589 = sext i32 %588 to i64
  %590 = load %struct.key_set** %2, align 8
  %591 = getelementptr inbounds %struct.key_set* %590, i64 %589
  %592 = getelementptr inbounds %struct.key_set* %591, i32 0, i32 2
  %593 = getelementptr inbounds [4 x i8]* %592, i32 0, i64 2
  %594 = load i8* %593, align 1
  %595 = zext i8 %594 to i32
  %596 = xor i32 -59170357, -1
  %597 = or i32 %587, -59170357
  %598 = or i32 %595, -59170357
  %599 = or i32 %587, %596
  %600 = or i32 %595, %596
  %601 = and i32 %597, %598
  %602 = and i32 %601, %599
  %603 = and i32 %602, %600
  %604 = and i32 %587, %595
  %605 = trunc i32 %603 to i8
  store i8 %605, i8* %third_shift_bits, align 1
  %606 = load i8* %shift_byte, align 1
  %607 = zext i8 %606 to i32
  %608 = load i32* %i, align 4
  %609 = sext i32 %608 to i64
  %610 = load %struct.key_set** %2, align 8
  %611 = getelementptr inbounds %struct.key_set* %610, i64 %609
  %612 = getelementptr inbounds %struct.key_set* %611, i32 0, i32 2
  %613 = getelementptr inbounds [4 x i8]* %612, i32 0, i64 3
  %614 = load i8* %613, align 1
  %615 = zext i8 %614 to i32
  %616 = xor i32 963806214, -1
  %617 = or i32 %607, 963806214
  %618 = or i32 %615, 963806214
  %619 = or i32 %607, %616
  %620 = or i32 %615, %616
  %621 = and i32 %617, %618
  %622 = and i32 %621, %619
  %623 = and i32 %622, %620
  %624 = and i32 %607, %615
  %625 = trunc i32 %623 to i8
  store i8 %625, i8* %fourth_shift_bits, align 1
  %626 = load i32* %shift_size, align 4
  %627 = load i32* %i, align 4
  %628 = sext i32 %627 to i64
  %629 = load %struct.key_set** %2, align 8
  %630 = getelementptr inbounds %struct.key_set* %629, i64 %628
  %631 = getelementptr inbounds %struct.key_set* %630, i32 0, i32 2
  %632 = getelementptr inbounds [4 x i8]* %631, i32 0, i64 0
  %633 = load i8* %632, align 1
  %634 = zext i8 %633 to i32
  %635 = shl i32 %634, %626
  %636 = trunc i32 %635 to i8
  store i8 %636, i8* %632, align 1
  %637 = load i8* %second_shift_bits, align 1
  %638 = zext i8 %637 to i32
  %639 = load i32* %shift_size, align 4
  %640 = sub i32 0, %639
  %641 = xor i32 8, %640
  %642 = and i32 8, %640
  %643 = add i32 %642, %642
  %644 = add nsw i32 %641, %643
  %645 = sub nsw i32 8, %639
  %646 = ashr i32 %638, %644
  %647 = load i32* %i, align 4
  %648 = sext i32 %647 to i64
  %649 = load %struct.key_set** %2, align 8
  %650 = getelementptr inbounds %struct.key_set* %649, i64 %648
  %651 = getelementptr inbounds %struct.key_set* %650, i32 0, i32 2
  %652 = getelementptr inbounds [4 x i8]* %651, i32 0, i64 0
  %653 = load i8* %652, align 1
  %654 = zext i8 %653 to i32
  %655 = and i32 %654, %646
  %656 = xor i32 %654, %646
  %657 = or i32 %655, %656
  %658 = or i32 %654, %646
  %659 = trunc i32 %657 to i8
  store i8 %659, i8* %652, align 1
  %660 = load i32* %shift_size, align 4
  %661 = load i32* %i, align 4
  %662 = sext i32 %661 to i64
  %663 = load %struct.key_set** %2, align 8
  %664 = getelementptr inbounds %struct.key_set* %663, i64 %662
  %665 = getelementptr inbounds %struct.key_set* %664, i32 0, i32 2
  %666 = getelementptr inbounds [4 x i8]* %665, i32 0, i64 1
  %667 = load i8* %666, align 1
  %668 = zext i8 %667 to i32
  %669 = shl i32 %668, %660
  %670 = trunc i32 %669 to i8
  store i8 %670, i8* %666, align 1
  %671 = load i8* %third_shift_bits, align 1
  %672 = zext i8 %671 to i32
  %673 = load i32* %shift_size, align 4
  %674 = sub i32 0, %673
  %675 = xor i32 8, %674
  %676 = and i32 8, %674
  %677 = add i32 %676, %676
  %678 = add nsw i32 %675, %677
  %679 = sub nsw i32 8, %673
  %680 = ashr i32 %672, %678
  %681 = load i32* %i, align 4
  %682 = sext i32 %681 to i64
  %683 = load %struct.key_set** %2, align 8
  %684 = getelementptr inbounds %struct.key_set* %683, i64 %682
  %685 = getelementptr inbounds %struct.key_set* %684, i32 0, i32 2
  %686 = getelementptr inbounds [4 x i8]* %685, i32 0, i64 1
  %687 = load i8* %686, align 1
  %688 = zext i8 %687 to i32
  %689 = xor i32 %688, -1
  %690 = xor i32 %680, -1
  %691 = xor i32 -1159316339, -1
  %692 = and i32 %689, -1159316339
  %693 = and i32 %688, %691
  %694 = and i32 %690, -1159316339
  %695 = and i32 %680, %691
  %696 = or i32 %692, %693
  %697 = or i32 %694, %695
  %698 = xor i32 %696, %697
  %699 = or i32 %689, %690
  %700 = xor i32 %699, -1
  %701 = or i32 -1159316339, %691
  %702 = and i32 %700, %701
  %703 = or i32 %698, %702
  %704 = or i32 %688, %680
  %705 = trunc i32 %703 to i8
  store i8 %705, i8* %686, align 1
  %706 = load i32* %shift_size, align 4
  %707 = load i32* %i, align 4
  %708 = sext i32 %707 to i64
  %709 = load %struct.key_set** %2, align 8
  %710 = getelementptr inbounds %struct.key_set* %709, i64 %708
  %711 = getelementptr inbounds %struct.key_set* %710, i32 0, i32 2
  %712 = getelementptr inbounds [4 x i8]* %711, i32 0, i64 2
  %713 = load i8* %712, align 1
  %714 = zext i8 %713 to i32
  %715 = shl i32 %714, %706
  %716 = trunc i32 %715 to i8
  store i8 %716, i8* %712, align 1
  %717 = load i8* %fourth_shift_bits, align 1
  %718 = zext i8 %717 to i32
  %719 = load i32* %shift_size, align 4
  %720 = sub i32 0, %719
  %721 = xor i32 8, %720
  %722 = and i32 8, %720
  %723 = add i32 %722, %722
  %724 = add nsw i32 %721, %723
  %725 = sub nsw i32 8, %719
  %726 = ashr i32 %718, %724
  %727 = load i32* %i, align 4
  %728 = sext i32 %727 to i64
  %729 = load %struct.key_set** %2, align 8
  %730 = getelementptr inbounds %struct.key_set* %729, i64 %728
  %731 = getelementptr inbounds %struct.key_set* %730, i32 0, i32 2
  %732 = getelementptr inbounds [4 x i8]* %731, i32 0, i64 2
  %733 = load i8* %732, align 1
  %734 = zext i8 %733 to i32
  %735 = and i32 %734, %726
  %736 = xor i32 %734, %726
  %737 = or i32 %735, %736
  %738 = or i32 %734, %726
  %739 = trunc i32 %737 to i8
  store i8 %739, i8* %732, align 1
  %740 = load i32* %shift_size, align 4
  %741 = load i32* %i, align 4
  %742 = sext i32 %741 to i64
  %743 = load %struct.key_set** %2, align 8
  %744 = getelementptr inbounds %struct.key_set* %743, i64 %742
  %745 = getelementptr inbounds %struct.key_set* %744, i32 0, i32 2
  %746 = getelementptr inbounds [4 x i8]* %745, i32 0, i64 3
  %747 = load i8* %746, align 1
  %748 = zext i8 %747 to i32
  %749 = shl i32 %748, %740
  %750 = trunc i32 %749 to i8
  store i8 %750, i8* %746, align 1
  %751 = load i8* %first_shift_bits, align 1
  %752 = zext i8 %751 to i32
  %753 = load i32* %shift_size, align 4
  %754 = sub i32 0, %753
  %755 = xor i32 4, %754
  %756 = and i32 4, %754
  %757 = add i32 %756, %756
  %758 = add nsw i32 %755, %757
  %759 = sub nsw i32 4, %753
  %760 = ashr i32 %752, %758
  %761 = load i32* %i, align 4
  %762 = sext i32 %761 to i64
  %763 = load %struct.key_set** %2, align 8
  %764 = getelementptr inbounds %struct.key_set* %763, i64 %762
  %765 = getelementptr inbounds %struct.key_set* %764, i32 0, i32 2
  %766 = getelementptr inbounds [4 x i8]* %765, i32 0, i64 3
  %767 = load i8* %766, align 1
  %768 = zext i8 %767 to i32
  %769 = and i32 %768, %760
  %770 = xor i32 %768, %760
  %771 = or i32 %769, %770
  %772 = or i32 %768, %760
  %773 = trunc i32 %771 to i8
  store i8 %773, i8* %766, align 1
  store i32 0, i32* %j, align 4
  br label %774

; <label>:774                                     ; preds = %910, %317
  %775 = load i32* %j, align 4
  %776 = icmp slt i32 %775, 48
  br i1 %776, label %777, label %917

; <label>:777                                     ; preds = %774
  %778 = load i32* %j, align 4
  %779 = sext i32 %778 to i64
  %780 = getelementptr inbounds [48 x i32]* @sub_key_permutation, i32 0, i64 %779
  %781 = load i32* %780, align 4
  store i32 %781, i32* %shift_size, align 4
  %782 = load i32* %shift_size, align 4
  %783 = icmp sle i32 %782, 28
  br i1 %783, label %784, label %836

; <label>:784                                     ; preds = %777
  %785 = load i32* %shift_size, align 4
  %786 = sub i32 0, 1
  %787 = xor i32 %785, %786
  %788 = and i32 %785, %786
  %789 = add i32 %788, %788
  %790 = add nsw i32 %787, %789
  %791 = sub nsw i32 %785, 1
  %792 = srem i32 %790, 8
  %793 = ashr i32 128, %792
  %794 = trunc i32 %793 to i8
  store i8 %794, i8* %shift_byte, align 1
  %795 = load i32* %shift_size, align 4
  %796 = sub i32 0, 1
  %797 = xor i32 %795, %796
  %798 = and i32 %795, %796
  %799 = add i32 %798, %798
  %800 = add nsw i32 %797, %799
  %801 = sub nsw i32 %795, 1
  %802 = sdiv i32 %800, 8
  %803 = sext i32 %802 to i64
  %804 = load i32* %i, align 4
  %805 = sext i32 %804 to i64
  %806 = load %struct.key_set** %2, align 8
  %807 = getelementptr inbounds %struct.key_set* %806, i64 %805
  %808 = getelementptr inbounds %struct.key_set* %807, i32 0, i32 1
  %809 = getelementptr inbounds [4 x i8]* %808, i32 0, i64 %803
  %810 = load i8* %809, align 1
  %811 = zext i8 %810 to i32
  %812 = load i8* %shift_byte, align 1
  %813 = zext i8 %812 to i32
  %814 = xor i32 304276916, -1
  %815 = or i32 %813, 304276916
  %816 = or i32 %811, 304276916
  %817 = or i32 %813, %814
  %818 = or i32 %811, %814
  %819 = and i32 %815, %816
  %820 = and i32 %819, %817
  %821 = and i32 %820, %818
  %822 = and i32 %813, %811
  %823 = trunc i32 %821 to i8
  store i8 %823, i8* %shift_byte, align 1
  %824 = load i32* %shift_size, align 4
  %825 = sub i32 0, 1
  %826 = xor i32 %824, %825
  %827 = and i32 %824, %825
  %828 = add i32 %827, %827
  %829 = add nsw i32 %826, %828
  %830 = sub nsw i32 %824, 1
  %831 = srem i32 %829, 8
  %832 = load i8* %shift_byte, align 1
  %833 = zext i8 %832 to i32
  %834 = shl i32 %833, %831
  %835 = trunc i32 %834 to i8
  store i8 %835, i8* %shift_byte, align 1
  br label %888

; <label>:836                                     ; preds = %777
  %837 = load i32* %shift_size, align 4
  %838 = sub i32 0, 29
  %839 = xor i32 %837, %838
  %840 = and i32 %837, %838
  %841 = add i32 %840, %840
  %842 = add nsw i32 %839, %841
  %843 = sub nsw i32 %837, 29
  %844 = srem i32 %842, 8
  %845 = ashr i32 128, %844
  %846 = trunc i32 %845 to i8
  store i8 %846, i8* %shift_byte, align 1
  %847 = load i32* %shift_size, align 4
  %848 = sub i32 0, 29
  %849 = xor i32 %847, %848
  %850 = and i32 %847, %848
  %851 = add i32 %850, %850
  %852 = add nsw i32 %849, %851
  %853 = sub nsw i32 %847, 29
  %854 = sdiv i32 %852, 8
  %855 = sext i32 %854 to i64
  %856 = load i32* %i, align 4
  %857 = sext i32 %856 to i64
  %858 = load %struct.key_set** %2, align 8
  %859 = getelementptr inbounds %struct.key_set* %858, i64 %857
  %860 = getelementptr inbounds %struct.key_set* %859, i32 0, i32 2
  %861 = getelementptr inbounds [4 x i8]* %860, i32 0, i64 %855
  %862 = load i8* %861, align 1
  %863 = zext i8 %862 to i32
  %864 = load i8* %shift_byte, align 1
  %865 = zext i8 %864 to i32
  %866 = xor i32 2077392058, -1
  %867 = or i32 %865, 2077392058
  %868 = or i32 %863, 2077392058
  %869 = or i32 %865, %866
  %870 = or i32 %863, %866
  %871 = and i32 %867, %868
  %872 = and i32 %871, %869
  %873 = and i32 %872, %870
  %874 = and i32 %865, %863
  %875 = trunc i32 %873 to i8
  store i8 %875, i8* %shift_byte, align 1
  %876 = load i32* %shift_size, align 4
  %877 = sub i32 0, 29
  %878 = xor i32 %876, %877
  %879 = and i32 %876, %877
  %880 = add i32 %879, %879
  %881 = add nsw i32 %878, %880
  %882 = sub nsw i32 %876, 29
  %883 = srem i32 %881, 8
  %884 = load i8* %shift_byte, align 1
  %885 = zext i8 %884 to i32
  %886 = shl i32 %885, %883
  %887 = trunc i32 %886 to i8
  store i8 %887, i8* %shift_byte, align 1
  br label %888

; <label>:888                                     ; preds = %836, %784
  %889 = load i8* %shift_byte, align 1
  %890 = zext i8 %889 to i32
  %891 = load i32* %j, align 4
  %892 = srem i32 %891, 8
  %893 = ashr i32 %890, %892
  %894 = load i32* %j, align 4
  %895 = sdiv i32 %894, 8
  %896 = sext i32 %895 to i64
  %897 = load i32* %i, align 4
  %898 = sext i32 %897 to i64
  %899 = load %struct.key_set** %2, align 8
  %900 = getelementptr inbounds %struct.key_set* %899, i64 %898
  %901 = getelementptr inbounds %struct.key_set* %900, i32 0, i32 0
  %902 = getelementptr inbounds [8 x i8]* %901, i32 0, i64 %896
  %903 = load i8* %902, align 1
  %904 = zext i8 %903 to i32
  %905 = and i32 %904, %893
  %906 = xor i32 %904, %893
  %907 = or i32 %905, %906
  %908 = or i32 %904, %893
  %909 = trunc i32 %907 to i8
  store i8 %909, i8* %902, align 1
  br label %910

; <label>:910                                     ; preds = %888
  %911 = load i32* %j, align 4
  %912 = xor i32 %911, 1
  %913 = and i32 %911, 1
  %914 = add i32 %913, %913
  %915 = add nsw i32 %912, %914
  %916 = add nsw i32 %911, 1
  store i32 %915, i32* %j, align 4
  br label %774

; <label>:917                                     ; preds = %774
  br label %918

; <label>:918                                     ; preds = %917
  %919 = load i32* %i, align 4
  %920 = xor i32 %919, 1
  %921 = and i32 %919, 1
  %922 = add i32 %921, %921
  %923 = add nsw i32 %920, %922
  %924 = add nsw i32 %919, 1
  store i32 %923, i32* %i, align 4
  br label %247

; <label>:925                                     ; preds = %247
  ret void
}

; Function Attrs: nounwind uwtable
define void @process_message(i8* %message_piece, i8* %processed_piece, %struct.key_set* %key_sets, i32 %mode) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca %struct.key_set*, align 8
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %shift_size = alloca i32, align 4
  %shift_byte = alloca i8, align 1
  %initial_permutation = alloca [8 x i8], align 1
  %l = alloca [4 x i8], align 1
  %r = alloca [4 x i8], align 1
  %ln = alloca [4 x i8], align 1
  %rn = alloca [4 x i8], align 1
  %er = alloca [6 x i8], align 1
  %ser = alloca [4 x i8], align 1
  %key_index = alloca i32, align 4
  %row = alloca i8, align 1
  %column = alloca i8, align 1
  %pre_end_permutation = alloca [8 x i8], align 1
  store i8* %message_piece, i8** %1, align 8
  store i8* %processed_piece, i8** %2, align 8
  store %struct.key_set* %key_sets, %struct.key_set** %3, align 8
  store i32 %mode, i32* %4, align 4
  %5 = bitcast [8 x i8]* %initial_permutation to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 8, i32 1, i1 false)
  %6 = load i8** %2, align 8
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 8, i32 1, i1 false)
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %78, %0
  %8 = load i32* %i, align 4
  %9 = icmp slt i32 %8, 64
  br i1 %9, label %10, label %85

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [64 x i32]* @initial_message_permutation, i32 0, i64 %12
  %14 = load i32* %13, align 4
  store i32 %14, i32* %shift_size, align 4
  %15 = load i32* %shift_size, align 4
  %16 = sub i32 0, 1
  %17 = xor i32 %15, %16
  %18 = and i32 %15, %16
  %19 = add i32 %18, %18
  %20 = add nsw i32 %17, %19
  %21 = sub nsw i32 %15, 1
  %22 = srem i32 %20, 8
  %23 = ashr i32 128, %22
  %24 = trunc i32 %23 to i8
  store i8 %24, i8* %shift_byte, align 1
  %25 = load i32* %shift_size, align 4
  %26 = sub i32 0, 1
  %27 = xor i32 %25, %26
  %28 = and i32 %25, %26
  %29 = add i32 %28, %28
  %30 = add nsw i32 %27, %29
  %31 = sub nsw i32 %25, 1
  %32 = sdiv i32 %30, 8
  %33 = sext i32 %32 to i64
  %34 = load i8** %1, align 8
  %35 = getelementptr inbounds i8* %34, i64 %33
  %36 = load i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = load i8* %shift_byte, align 1
  %39 = zext i8 %38 to i32
  %40 = xor i32 1541836789, -1
  %41 = or i32 %39, 1541836789
  %42 = or i32 %37, 1541836789
  %43 = or i32 %39, %40
  %44 = or i32 %37, %40
  %45 = and i32 %41, %42
  %46 = and i32 %45, %43
  %47 = and i32 %46, %44
  %48 = and i32 %39, %37
  %49 = trunc i32 %47 to i8
  store i8 %49, i8* %shift_byte, align 1
  %50 = load i32* %shift_size, align 4
  %51 = sub i32 0, 1
  %52 = xor i32 %50, %51
  %53 = and i32 %50, %51
  %54 = add i32 %53, %53
  %55 = add nsw i32 %52, %54
  %56 = sub nsw i32 %50, 1
  %57 = srem i32 %55, 8
  %58 = load i8* %shift_byte, align 1
  %59 = zext i8 %58 to i32
  %60 = shl i32 %59, %57
  %61 = trunc i32 %60 to i8
  store i8 %61, i8* %shift_byte, align 1
  %62 = load i8* %shift_byte, align 1
  %63 = zext i8 %62 to i32
  %64 = load i32* %i, align 4
  %65 = srem i32 %64, 8
  %66 = ashr i32 %63, %65
  %67 = load i32* %i, align 4
  %68 = sdiv i32 %67, 8
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = and i32 %72, %66
  %74 = xor i32 %72, %66
  %75 = or i32 %73, %74
  %76 = or i32 %72, %66
  %77 = trunc i32 %75 to i8
  store i8 %77, i8* %70, align 1
  br label %78

; <label>:78                                      ; preds = %10
  %79 = load i32* %i, align 4
  %80 = xor i32 %79, 1
  %81 = and i32 %79, 1
  %82 = add i32 %81, %81
  %83 = add nsw i32 %80, %82
  %84 = add nsw i32 %79, 1
  store i32 %83, i32* %i, align 4
  br label %7

; <label>:85                                      ; preds = %7
  store i32 0, i32* %i, align 4
  br label %86

; <label>:86                                      ; preds = %109, %85
  %87 = load i32* %i, align 4
  %88 = icmp slt i32 %87, 4
  br i1 %88, label %89, label %116

; <label>:89                                      ; preds = %86
  %90 = load i32* %i, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %91
  %93 = load i8* %92, align 1
  %94 = load i32* %i, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %95
  store i8 %93, i8* %96, align 1
  %97 = load i32* %i, align 4
  %98 = xor i32 %97, 4
  %99 = and i32 %97, 4
  %100 = add i32 %99, %99
  %101 = add nsw i32 %98, %100
  %102 = add nsw i32 %97, 4
  %103 = sext i32 %101 to i64
  %104 = getelementptr inbounds [8 x i8]* %initial_permutation, i32 0, i64 %103
  %105 = load i8* %104, align 1
  %106 = load i32* %i, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %107
  store i8 %105, i8* %108, align 1
  br label %109

; <label>:109                                     ; preds = %89
  %110 = load i32* %i, align 4
  %111 = xor i32 %110, 1
  %112 = and i32 %110, 1
  %113 = add i32 %112, %112
  %114 = add nsw i32 %111, %113
  %115 = add nsw i32 %110, 1
  store i32 %114, i32* %i, align 4
  br label %86

; <label>:116                                     ; preds = %86
  store i32 1, i32* %k, align 4
  br label %117

; <label>:117                                     ; preds = %1370, %116
  %118 = load i32* %k, align 4
  %119 = icmp sle i32 %118, 16
  br i1 %119, label %120, label %1377

; <label>:120                                     ; preds = %117
  %121 = bitcast [4 x i8]* %ln to i8*
  %122 = bitcast [4 x i8]* %r to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %121, i8* %122, i64 4, i32 1, i1 false)
  %123 = bitcast [6 x i8]* %er to i8*
  call void @llvm.memset.p0i8.i64(i8* %123, i8 0, i64 6, i32 1, i1 false)
  store i32 0, i32* %i, align 4
  br label %124

; <label>:124                                     ; preds = %194, %120
  %125 = load i32* %i, align 4
  %126 = icmp slt i32 %125, 48
  br i1 %126, label %127, label %201

; <label>:127                                     ; preds = %124
  %128 = load i32* %i, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [48 x i32]* @message_expansion, i32 0, i64 %129
  %131 = load i32* %130, align 4
  store i32 %131, i32* %shift_size, align 4
  %132 = load i32* %shift_size, align 4
  %133 = sub i32 0, 1
  %134 = xor i32 %132, %133
  %135 = and i32 %132, %133
  %136 = add i32 %135, %135
  %137 = add nsw i32 %134, %136
  %138 = sub nsw i32 %132, 1
  %139 = srem i32 %137, 8
  %140 = ashr i32 128, %139
  %141 = trunc i32 %140 to i8
  store i8 %141, i8* %shift_byte, align 1
  %142 = load i32* %shift_size, align 4
  %143 = sub i32 0, 1
  %144 = xor i32 %142, %143
  %145 = and i32 %142, %143
  %146 = add i32 %145, %145
  %147 = add nsw i32 %144, %146
  %148 = sub nsw i32 %142, 1
  %149 = sdiv i32 %147, 8
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %150
  %152 = load i8* %151, align 1
  %153 = zext i8 %152 to i32
  %154 = load i8* %shift_byte, align 1
  %155 = zext i8 %154 to i32
  %156 = xor i32 -920479068, -1
  %157 = or i32 %155, -920479068
  %158 = or i32 %153, -920479068
  %159 = or i32 %155, %156
  %160 = or i32 %153, %156
  %161 = and i32 %157, %158
  %162 = and i32 %161, %159
  %163 = and i32 %162, %160
  %164 = and i32 %155, %153
  %165 = trunc i32 %163 to i8
  store i8 %165, i8* %shift_byte, align 1
  %166 = load i32* %shift_size, align 4
  %167 = sub i32 0, 1
  %168 = xor i32 %166, %167
  %169 = and i32 %166, %167
  %170 = add i32 %169, %169
  %171 = add nsw i32 %168, %170
  %172 = sub nsw i32 %166, 1
  %173 = srem i32 %171, 8
  %174 = load i8* %shift_byte, align 1
  %175 = zext i8 %174 to i32
  %176 = shl i32 %175, %173
  %177 = trunc i32 %176 to i8
  store i8 %177, i8* %shift_byte, align 1
  %178 = load i8* %shift_byte, align 1
  %179 = zext i8 %178 to i32
  %180 = load i32* %i, align 4
  %181 = srem i32 %180, 8
  %182 = ashr i32 %179, %181
  %183 = load i32* %i, align 4
  %184 = sdiv i32 %183, 8
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 %185
  %187 = load i8* %186, align 1
  %188 = zext i8 %187 to i32
  %189 = and i32 %188, %182
  %190 = xor i32 %188, %182
  %191 = or i32 %189, %190
  %192 = or i32 %188, %182
  %193 = trunc i32 %191 to i8
  store i8 %193, i8* %186, align 1
  br label %194

; <label>:194                                     ; preds = %127
  %195 = load i32* %i, align 4
  %196 = xor i32 %195, 1
  %197 = and i32 %195, 1
  %198 = add i32 %197, %197
  %199 = add nsw i32 %196, %198
  %200 = add nsw i32 %195, 1
  store i32 %199, i32* %i, align 4
  br label %124

; <label>:201                                     ; preds = %124
  %202 = load i32* %4, align 4
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %212

; <label>:204                                     ; preds = %201
  %205 = load i32* %k, align 4
  %206 = sub i32 0, %205
  %207 = xor i32 17, %206
  %208 = and i32 17, %206
  %209 = add i32 %208, %208
  %210 = add nsw i32 %207, %209
  %211 = sub nsw i32 17, %205
  store i32 %210, i32* %key_index, align 4
  br label %214

; <label>:212                                     ; preds = %201
  %213 = load i32* %k, align 4
  store i32 %213, i32* %key_index, align 4
  br label %214

; <label>:214                                     ; preds = %212, %204
  store i32 0, i32* %i, align 4
  br label %215

; <label>:215                                     ; preds = %240, %214
  %216 = load i32* %i, align 4
  %217 = icmp slt i32 %216, 6
  br i1 %217, label %218, label %247

; <label>:218                                     ; preds = %215
  %219 = load i32* %i, align 4
  %220 = sext i32 %219 to i64
  %221 = load i32* %key_index, align 4
  %222 = sext i32 %221 to i64
  %223 = load %struct.key_set** %3, align 8
  %224 = getelementptr inbounds %struct.key_set* %223, i64 %222
  %225 = getelementptr inbounds %struct.key_set* %224, i32 0, i32 0
  %226 = getelementptr inbounds [8 x i8]* %225, i32 0, i64 %220
  %227 = load i8* %226, align 1
  %228 = zext i8 %227 to i32
  %229 = load i32* %i, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 %230
  %232 = load i8* %231, align 1
  %233 = zext i8 %232 to i32
  %234 = and i32 %233, %228
  %235 = add i32 %234, %234
  %236 = add i32 %233, %228
  %237 = sub i32 %236, %235
  %238 = xor i32 %233, %228
  %239 = trunc i32 %237 to i8
  store i8 %239, i8* %231, align 1
  br label %240

; <label>:240                                     ; preds = %218
  %241 = load i32* %i, align 4
  %242 = xor i32 %241, 1
  %243 = and i32 %241, 1
  %244 = add i32 %243, %243
  %245 = add nsw i32 %242, %244
  %246 = add nsw i32 %241, 1
  store i32 %245, i32* %i, align 4
  br label %215

; <label>:247                                     ; preds = %215
  store i32 0, i32* %i, align 4
  br label %248

; <label>:248                                     ; preds = %255, %247
  %249 = load i32* %i, align 4
  %250 = icmp slt i32 %249, 4
  br i1 %250, label %251, label %262

; <label>:251                                     ; preds = %248
  %252 = load i32* %i, align 4
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 %253
  store i8 0, i8* %254, align 1
  br label %255

; <label>:255                                     ; preds = %251
  %256 = load i32* %i, align 4
  %257 = xor i32 %256, 1
  %258 = and i32 %256, 1
  %259 = add i32 %258, %258
  %260 = add nsw i32 %257, %259
  %261 = add nsw i32 %256, 1
  store i32 %260, i32* %i, align 4
  br label %248

; <label>:262                                     ; preds = %248
  store i8 0, i8* %row, align 1
  %263 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %264 = load i8* %263, align 1
  %265 = zext i8 %264 to i32
  %266 = xor i32 1924128796, -1
  %267 = or i32 %265, 1924128796
  %268 = or i32 128, 1924128796
  %269 = or i32 %265, %266
  %270 = or i32 128, %266
  %271 = and i32 %267, %268
  %272 = and i32 %271, %269
  %273 = and i32 %272, %270
  %274 = and i32 %265, 128
  %275 = ashr i32 %273, 6
  %276 = load i8* %row, align 1
  %277 = zext i8 %276 to i32
  %278 = xor i32 %277, -1
  %279 = xor i32 %275, -1
  %280 = xor i32 1785233525, -1
  %281 = and i32 %278, 1785233525
  %282 = and i32 %277, %280
  %283 = and i32 %279, 1785233525
  %284 = and i32 %275, %280
  %285 = or i32 %281, %282
  %286 = or i32 %283, %284
  %287 = xor i32 %285, %286
  %288 = or i32 %278, %279
  %289 = xor i32 %288, -1
  %290 = or i32 1785233525, %280
  %291 = and i32 %289, %290
  %292 = or i32 %287, %291
  %293 = or i32 %277, %275
  %294 = trunc i32 %292 to i8
  store i8 %294, i8* %row, align 1
  %295 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %296 = load i8* %295, align 1
  %297 = zext i8 %296 to i32
  %298 = xor i32 -663461777, -1
  %299 = or i32 %297, -663461777
  %300 = or i32 4, -663461777
  %301 = or i32 %297, %298
  %302 = or i32 4, %298
  %303 = and i32 %299, %300
  %304 = and i32 %303, %301
  %305 = and i32 %304, %302
  %306 = and i32 %297, 4
  %307 = ashr i32 %305, 2
  %308 = load i8* %row, align 1
  %309 = zext i8 %308 to i32
  %310 = and i32 %309, %307
  %311 = xor i32 %309, %307
  %312 = or i32 %310, %311
  %313 = or i32 %309, %307
  %314 = trunc i32 %312 to i8
  store i8 %314, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %315 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %316 = load i8* %315, align 1
  %317 = zext i8 %316 to i32
  %318 = xor i32 -1646665232, -1
  %319 = or i32 %317, -1646665232
  %320 = or i32 120, -1646665232
  %321 = or i32 %317, %318
  %322 = or i32 120, %318
  %323 = and i32 %319, %320
  %324 = and i32 %323, %321
  %325 = and i32 %324, %322
  %326 = and i32 %317, 120
  %327 = ashr i32 %325, 3
  %328 = load i8* %column, align 1
  %329 = zext i8 %328 to i32
  %330 = and i32 %329, %327
  %331 = xor i32 %329, %327
  %332 = or i32 %330, %331
  %333 = or i32 %329, %327
  %334 = trunc i32 %332 to i8
  store i8 %334, i8* %column, align 1
  %335 = load i8* %row, align 1
  %336 = zext i8 %335 to i32
  %337 = mul nsw i32 %336, 16
  %338 = load i8* %column, align 1
  %339 = zext i8 %338 to i32
  %340 = xor i32 %337, %339
  %341 = and i32 %337, %339
  %342 = add i32 %341, %341
  %343 = add nsw i32 %340, %342
  %344 = add nsw i32 %337, %339
  %345 = sext i32 %343 to i64
  %346 = getelementptr inbounds [64 x i32]* @S1, i32 0, i64 %345
  %347 = load i32* %346, align 4
  %348 = trunc i32 %347 to i8
  %349 = zext i8 %348 to i32
  %350 = shl i32 %349, 4
  %351 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 0
  %352 = load i8* %351, align 1
  %353 = zext i8 %352 to i32
  %354 = xor i32 %353, -1
  %355 = xor i32 %350, -1
  %356 = xor i32 1421819083, -1
  %357 = and i32 %354, 1421819083
  %358 = and i32 %353, %356
  %359 = and i32 %355, 1421819083
  %360 = and i32 %350, %356
  %361 = or i32 %357, %358
  %362 = or i32 %359, %360
  %363 = xor i32 %361, %362
  %364 = or i32 %354, %355
  %365 = xor i32 %364, -1
  %366 = or i32 1421819083, %356
  %367 = and i32 %365, %366
  %368 = or i32 %363, %367
  %369 = or i32 %353, %350
  %370 = trunc i32 %368 to i8
  store i8 %370, i8* %351, align 1
  store i8 0, i8* %row, align 1
  %371 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %372 = load i8* %371, align 1
  %373 = zext i8 %372 to i32
  %374 = xor i32 863183674, -1
  %375 = or i32 %373, 863183674
  %376 = or i32 2, 863183674
  %377 = or i32 %373, %374
  %378 = or i32 2, %374
  %379 = and i32 %375, %376
  %380 = and i32 %379, %377
  %381 = and i32 %380, %378
  %382 = and i32 %373, 2
  %383 = load i8* %row, align 1
  %384 = zext i8 %383 to i32
  %385 = and i32 %384, %381
  %386 = xor i32 %384, %381
  %387 = or i32 %385, %386
  %388 = or i32 %384, %381
  %389 = trunc i32 %387 to i8
  store i8 %389, i8* %row, align 1
  %390 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %391 = load i8* %390, align 1
  %392 = zext i8 %391 to i32
  %393 = xor i32 -1089486685, -1
  %394 = or i32 %392, -1089486685
  %395 = or i32 16, -1089486685
  %396 = or i32 %392, %393
  %397 = or i32 16, %393
  %398 = and i32 %394, %395
  %399 = and i32 %398, %396
  %400 = and i32 %399, %397
  %401 = and i32 %392, 16
  %402 = ashr i32 %400, 4
  %403 = load i8* %row, align 1
  %404 = zext i8 %403 to i32
  %405 = and i32 %404, %402
  %406 = xor i32 %404, %402
  %407 = or i32 %405, %406
  %408 = or i32 %404, %402
  %409 = trunc i32 %407 to i8
  store i8 %409, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %410 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 0
  %411 = load i8* %410, align 1
  %412 = zext i8 %411 to i32
  %413 = xor i32 -1661764658, -1
  %414 = or i32 %412, -1661764658
  %415 = or i32 1, -1661764658
  %416 = or i32 %412, %413
  %417 = or i32 1, %413
  %418 = and i32 %414, %415
  %419 = and i32 %418, %416
  %420 = and i32 %419, %417
  %421 = and i32 %412, 1
  %422 = shl i32 %420, 3
  %423 = load i8* %column, align 1
  %424 = zext i8 %423 to i32
  %425 = and i32 %424, %422
  %426 = xor i32 %424, %422
  %427 = or i32 %425, %426
  %428 = or i32 %424, %422
  %429 = trunc i32 %427 to i8
  store i8 %429, i8* %column, align 1
  %430 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %431 = load i8* %430, align 1
  %432 = zext i8 %431 to i32
  %433 = xor i32 -177124054, -1
  %434 = or i32 %432, -177124054
  %435 = or i32 224, -177124054
  %436 = or i32 %432, %433
  %437 = or i32 224, %433
  %438 = and i32 %434, %435
  %439 = and i32 %438, %436
  %440 = and i32 %439, %437
  %441 = and i32 %432, 224
  %442 = ashr i32 %440, 5
  %443 = load i8* %column, align 1
  %444 = zext i8 %443 to i32
  %445 = and i32 %444, %442
  %446 = xor i32 %444, %442
  %447 = or i32 %445, %446
  %448 = or i32 %444, %442
  %449 = trunc i32 %447 to i8
  store i8 %449, i8* %column, align 1
  %450 = load i8* %row, align 1
  %451 = zext i8 %450 to i32
  %452 = mul nsw i32 %451, 16
  %453 = load i8* %column, align 1
  %454 = zext i8 %453 to i32
  %455 = xor i32 %452, %454
  %456 = and i32 %452, %454
  %457 = add i32 %456, %456
  %458 = add nsw i32 %455, %457
  %459 = add nsw i32 %452, %454
  %460 = sext i32 %458 to i64
  %461 = getelementptr inbounds [64 x i32]* @S2, i32 0, i64 %460
  %462 = load i32* %461, align 4
  %463 = trunc i32 %462 to i8
  %464 = zext i8 %463 to i32
  %465 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 0
  %466 = load i8* %465, align 1
  %467 = zext i8 %466 to i32
  %468 = xor i32 %467, -1
  %469 = xor i32 %464, -1
  %470 = xor i32 1227717364, -1
  %471 = and i32 %468, 1227717364
  %472 = and i32 %467, %470
  %473 = and i32 %469, 1227717364
  %474 = and i32 %464, %470
  %475 = or i32 %471, %472
  %476 = or i32 %473, %474
  %477 = xor i32 %475, %476
  %478 = or i32 %468, %469
  %479 = xor i32 %478, -1
  %480 = or i32 1227717364, %470
  %481 = and i32 %479, %480
  %482 = or i32 %477, %481
  %483 = or i32 %467, %464
  %484 = trunc i32 %482 to i8
  store i8 %484, i8* %465, align 1
  store i8 0, i8* %row, align 1
  %485 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %486 = load i8* %485, align 1
  %487 = zext i8 %486 to i32
  %488 = xor i32 -1430174736, -1
  %489 = or i32 %487, -1430174736
  %490 = or i32 8, -1430174736
  %491 = or i32 %487, %488
  %492 = or i32 8, %488
  %493 = and i32 %489, %490
  %494 = and i32 %493, %491
  %495 = and i32 %494, %492
  %496 = and i32 %487, 8
  %497 = ashr i32 %495, 2
  %498 = load i8* %row, align 1
  %499 = zext i8 %498 to i32
  %500 = and i32 %499, %497
  %501 = xor i32 %499, %497
  %502 = or i32 %500, %501
  %503 = or i32 %499, %497
  %504 = trunc i32 %502 to i8
  store i8 %504, i8* %row, align 1
  %505 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %506 = load i8* %505, align 1
  %507 = zext i8 %506 to i32
  %508 = xor i32 1537177632, -1
  %509 = or i32 %507, 1537177632
  %510 = or i32 64, 1537177632
  %511 = or i32 %507, %508
  %512 = or i32 64, %508
  %513 = and i32 %509, %510
  %514 = and i32 %513, %511
  %515 = and i32 %514, %512
  %516 = and i32 %507, 64
  %517 = ashr i32 %515, 6
  %518 = load i8* %row, align 1
  %519 = zext i8 %518 to i32
  %520 = xor i32 %519, -1
  %521 = xor i32 %517, -1
  %522 = xor i32 1905895302, -1
  %523 = and i32 %520, 1905895302
  %524 = and i32 %519, %522
  %525 = and i32 %521, 1905895302
  %526 = and i32 %517, %522
  %527 = or i32 %523, %524
  %528 = or i32 %525, %526
  %529 = xor i32 %527, %528
  %530 = or i32 %520, %521
  %531 = xor i32 %530, -1
  %532 = or i32 1905895302, %522
  %533 = and i32 %531, %532
  %534 = or i32 %529, %533
  %535 = or i32 %519, %517
  %536 = trunc i32 %534 to i8
  store i8 %536, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %537 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 1
  %538 = load i8* %537, align 1
  %539 = zext i8 %538 to i32
  %540 = xor i32 1123817116, -1
  %541 = or i32 %539, 1123817116
  %542 = or i32 7, 1123817116
  %543 = or i32 %539, %540
  %544 = or i32 7, %540
  %545 = and i32 %541, %542
  %546 = and i32 %545, %543
  %547 = and i32 %546, %544
  %548 = and i32 %539, 7
  %549 = shl i32 %547, 1
  %550 = load i8* %column, align 1
  %551 = zext i8 %550 to i32
  %552 = and i32 %551, %549
  %553 = xor i32 %551, %549
  %554 = or i32 %552, %553
  %555 = or i32 %551, %549
  %556 = trunc i32 %554 to i8
  store i8 %556, i8* %column, align 1
  %557 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %558 = load i8* %557, align 1
  %559 = zext i8 %558 to i32
  %560 = xor i32 -288532439, -1
  %561 = or i32 %559, -288532439
  %562 = or i32 128, -288532439
  %563 = or i32 %559, %560
  %564 = or i32 128, %560
  %565 = and i32 %561, %562
  %566 = and i32 %565, %563
  %567 = and i32 %566, %564
  %568 = and i32 %559, 128
  %569 = ashr i32 %567, 7
  %570 = load i8* %column, align 1
  %571 = zext i8 %570 to i32
  %572 = xor i32 %571, -1
  %573 = xor i32 %569, -1
  %574 = xor i32 2005219415, -1
  %575 = and i32 %572, 2005219415
  %576 = and i32 %571, %574
  %577 = and i32 %573, 2005219415
  %578 = and i32 %569, %574
  %579 = or i32 %575, %576
  %580 = or i32 %577, %578
  %581 = xor i32 %579, %580
  %582 = or i32 %572, %573
  %583 = xor i32 %582, -1
  %584 = or i32 2005219415, %574
  %585 = and i32 %583, %584
  %586 = or i32 %581, %585
  %587 = or i32 %571, %569
  %588 = trunc i32 %586 to i8
  store i8 %588, i8* %column, align 1
  %589 = load i8* %row, align 1
  %590 = zext i8 %589 to i32
  %591 = mul nsw i32 %590, 16
  %592 = load i8* %column, align 1
  %593 = zext i8 %592 to i32
  %594 = xor i32 %591, %593
  %595 = and i32 %591, %593
  %596 = add i32 %595, %595
  %597 = add nsw i32 %594, %596
  %598 = add nsw i32 %591, %593
  %599 = sext i32 %597 to i64
  %600 = getelementptr inbounds [64 x i32]* @S3, i32 0, i64 %599
  %601 = load i32* %600, align 4
  %602 = trunc i32 %601 to i8
  %603 = zext i8 %602 to i32
  %604 = shl i32 %603, 4
  %605 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 1
  %606 = load i8* %605, align 1
  %607 = zext i8 %606 to i32
  %608 = and i32 %607, %604
  %609 = xor i32 %607, %604
  %610 = or i32 %608, %609
  %611 = or i32 %607, %604
  %612 = trunc i32 %610 to i8
  store i8 %612, i8* %605, align 1
  store i8 0, i8* %row, align 1
  %613 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %614 = load i8* %613, align 1
  %615 = zext i8 %614 to i32
  %616 = xor i32 -156767041, -1
  %617 = or i32 %615, -156767041
  %618 = or i32 32, -156767041
  %619 = or i32 %615, %616
  %620 = or i32 32, %616
  %621 = and i32 %617, %618
  %622 = and i32 %621, %619
  %623 = and i32 %622, %620
  %624 = and i32 %615, 32
  %625 = ashr i32 %623, 4
  %626 = load i8* %row, align 1
  %627 = zext i8 %626 to i32
  %628 = xor i32 %627, -1
  %629 = xor i32 %625, -1
  %630 = xor i32 1043214646, -1
  %631 = and i32 %628, 1043214646
  %632 = and i32 %627, %630
  %633 = and i32 %629, 1043214646
  %634 = and i32 %625, %630
  %635 = or i32 %631, %632
  %636 = or i32 %633, %634
  %637 = xor i32 %635, %636
  %638 = or i32 %628, %629
  %639 = xor i32 %638, -1
  %640 = or i32 1043214646, %630
  %641 = and i32 %639, %640
  %642 = or i32 %637, %641
  %643 = or i32 %627, %625
  %644 = trunc i32 %642 to i8
  store i8 %644, i8* %row, align 1
  %645 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %646 = load i8* %645, align 1
  %647 = zext i8 %646 to i32
  %648 = xor i32 -527945051, -1
  %649 = or i32 %647, -527945051
  %650 = or i32 1, -527945051
  %651 = or i32 %647, %648
  %652 = or i32 1, %648
  %653 = and i32 %649, %650
  %654 = and i32 %653, %651
  %655 = and i32 %654, %652
  %656 = and i32 %647, 1
  %657 = load i8* %row, align 1
  %658 = zext i8 %657 to i32
  %659 = xor i32 %658, -1
  %660 = xor i32 %655, -1
  %661 = xor i32 -1773237112, -1
  %662 = and i32 %659, -1773237112
  %663 = and i32 %658, %661
  %664 = and i32 %660, -1773237112
  %665 = and i32 %655, %661
  %666 = or i32 %662, %663
  %667 = or i32 %664, %665
  %668 = xor i32 %666, %667
  %669 = or i32 %659, %660
  %670 = xor i32 %669, -1
  %671 = or i32 -1773237112, %661
  %672 = and i32 %670, %671
  %673 = or i32 %668, %672
  %674 = or i32 %658, %655
  %675 = trunc i32 %673 to i8
  store i8 %675, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %676 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 2
  %677 = load i8* %676, align 1
  %678 = zext i8 %677 to i32
  %679 = xor i32 -1954754494, -1
  %680 = or i32 %678, -1954754494
  %681 = or i32 30, -1954754494
  %682 = or i32 %678, %679
  %683 = or i32 30, %679
  %684 = and i32 %680, %681
  %685 = and i32 %684, %682
  %686 = and i32 %685, %683
  %687 = and i32 %678, 30
  %688 = ashr i32 %686, 1
  %689 = load i8* %column, align 1
  %690 = zext i8 %689 to i32
  %691 = and i32 %690, %688
  %692 = xor i32 %690, %688
  %693 = or i32 %691, %692
  %694 = or i32 %690, %688
  %695 = trunc i32 %693 to i8
  store i8 %695, i8* %column, align 1
  %696 = load i8* %row, align 1
  %697 = zext i8 %696 to i32
  %698 = mul nsw i32 %697, 16
  %699 = load i8* %column, align 1
  %700 = zext i8 %699 to i32
  %701 = xor i32 %698, %700
  %702 = and i32 %698, %700
  %703 = add i32 %702, %702
  %704 = add nsw i32 %701, %703
  %705 = add nsw i32 %698, %700
  %706 = sext i32 %704 to i64
  %707 = getelementptr inbounds [64 x i32]* @S4, i32 0, i64 %706
  %708 = load i32* %707, align 4
  %709 = trunc i32 %708 to i8
  %710 = zext i8 %709 to i32
  %711 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 1
  %712 = load i8* %711, align 1
  %713 = zext i8 %712 to i32
  %714 = and i32 %713, %710
  %715 = xor i32 %713, %710
  %716 = or i32 %714, %715
  %717 = or i32 %713, %710
  %718 = trunc i32 %716 to i8
  store i8 %718, i8* %711, align 1
  store i8 0, i8* %row, align 1
  %719 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %720 = load i8* %719, align 1
  %721 = zext i8 %720 to i32
  %722 = xor i32 1166289278, -1
  %723 = or i32 %721, 1166289278
  %724 = or i32 128, 1166289278
  %725 = or i32 %721, %722
  %726 = or i32 128, %722
  %727 = and i32 %723, %724
  %728 = and i32 %727, %725
  %729 = and i32 %728, %726
  %730 = and i32 %721, 128
  %731 = ashr i32 %729, 6
  %732 = load i8* %row, align 1
  %733 = zext i8 %732 to i32
  %734 = and i32 %733, %731
  %735 = xor i32 %733, %731
  %736 = or i32 %734, %735
  %737 = or i32 %733, %731
  %738 = trunc i32 %736 to i8
  store i8 %738, i8* %row, align 1
  %739 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %740 = load i8* %739, align 1
  %741 = zext i8 %740 to i32
  %742 = xor i32 711750167, -1
  %743 = or i32 %741, 711750167
  %744 = or i32 4, 711750167
  %745 = or i32 %741, %742
  %746 = or i32 4, %742
  %747 = and i32 %743, %744
  %748 = and i32 %747, %745
  %749 = and i32 %748, %746
  %750 = and i32 %741, 4
  %751 = ashr i32 %749, 2
  %752 = load i8* %row, align 1
  %753 = zext i8 %752 to i32
  %754 = and i32 %753, %751
  %755 = xor i32 %753, %751
  %756 = or i32 %754, %755
  %757 = or i32 %753, %751
  %758 = trunc i32 %756 to i8
  store i8 %758, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %759 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %760 = load i8* %759, align 1
  %761 = zext i8 %760 to i32
  %762 = xor i32 1188158073, -1
  %763 = or i32 %761, 1188158073
  %764 = or i32 120, 1188158073
  %765 = or i32 %761, %762
  %766 = or i32 120, %762
  %767 = and i32 %763, %764
  %768 = and i32 %767, %765
  %769 = and i32 %768, %766
  %770 = and i32 %761, 120
  %771 = ashr i32 %769, 3
  %772 = load i8* %column, align 1
  %773 = zext i8 %772 to i32
  %774 = xor i32 %773, -1
  %775 = xor i32 %771, -1
  %776 = xor i32 -396498402, -1
  %777 = and i32 %774, -396498402
  %778 = and i32 %773, %776
  %779 = and i32 %775, -396498402
  %780 = and i32 %771, %776
  %781 = or i32 %777, %778
  %782 = or i32 %779, %780
  %783 = xor i32 %781, %782
  %784 = or i32 %774, %775
  %785 = xor i32 %784, -1
  %786 = or i32 -396498402, %776
  %787 = and i32 %785, %786
  %788 = or i32 %783, %787
  %789 = or i32 %773, %771
  %790 = trunc i32 %788 to i8
  store i8 %790, i8* %column, align 1
  %791 = load i8* %row, align 1
  %792 = zext i8 %791 to i32
  %793 = mul nsw i32 %792, 16
  %794 = load i8* %column, align 1
  %795 = zext i8 %794 to i32
  %796 = xor i32 %793, %795
  %797 = and i32 %793, %795
  %798 = add i32 %797, %797
  %799 = add nsw i32 %796, %798
  %800 = add nsw i32 %793, %795
  %801 = sext i32 %799 to i64
  %802 = getelementptr inbounds [64 x i32]* @S5, i32 0, i64 %801
  %803 = load i32* %802, align 4
  %804 = trunc i32 %803 to i8
  %805 = zext i8 %804 to i32
  %806 = shl i32 %805, 4
  %807 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 2
  %808 = load i8* %807, align 1
  %809 = zext i8 %808 to i32
  %810 = and i32 %809, %806
  %811 = xor i32 %809, %806
  %812 = or i32 %810, %811
  %813 = or i32 %809, %806
  %814 = trunc i32 %812 to i8
  store i8 %814, i8* %807, align 1
  store i8 0, i8* %row, align 1
  %815 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %816 = load i8* %815, align 1
  %817 = zext i8 %816 to i32
  %818 = xor i32 399025571, -1
  %819 = or i32 %817, 399025571
  %820 = or i32 2, 399025571
  %821 = or i32 %817, %818
  %822 = or i32 2, %818
  %823 = and i32 %819, %820
  %824 = and i32 %823, %821
  %825 = and i32 %824, %822
  %826 = and i32 %817, 2
  %827 = load i8* %row, align 1
  %828 = zext i8 %827 to i32
  %829 = and i32 %828, %825
  %830 = xor i32 %828, %825
  %831 = or i32 %829, %830
  %832 = or i32 %828, %825
  %833 = trunc i32 %831 to i8
  store i8 %833, i8* %row, align 1
  %834 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %835 = load i8* %834, align 1
  %836 = zext i8 %835 to i32
  %837 = xor i32 -1694661025, -1
  %838 = or i32 %836, -1694661025
  %839 = or i32 16, -1694661025
  %840 = or i32 %836, %837
  %841 = or i32 16, %837
  %842 = and i32 %838, %839
  %843 = and i32 %842, %840
  %844 = and i32 %843, %841
  %845 = and i32 %836, 16
  %846 = ashr i32 %844, 4
  %847 = load i8* %row, align 1
  %848 = zext i8 %847 to i32
  %849 = xor i32 %848, -1
  %850 = xor i32 %846, -1
  %851 = xor i32 -813277937, -1
  %852 = and i32 %849, -813277937
  %853 = and i32 %848, %851
  %854 = and i32 %850, -813277937
  %855 = and i32 %846, %851
  %856 = or i32 %852, %853
  %857 = or i32 %854, %855
  %858 = xor i32 %856, %857
  %859 = or i32 %849, %850
  %860 = xor i32 %859, -1
  %861 = or i32 -813277937, %851
  %862 = and i32 %860, %861
  %863 = or i32 %858, %862
  %864 = or i32 %848, %846
  %865 = trunc i32 %863 to i8
  store i8 %865, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %866 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 3
  %867 = load i8* %866, align 1
  %868 = zext i8 %867 to i32
  %869 = xor i32 -1298742807, -1
  %870 = or i32 %868, -1298742807
  %871 = or i32 1, -1298742807
  %872 = or i32 %868, %869
  %873 = or i32 1, %869
  %874 = and i32 %870, %871
  %875 = and i32 %874, %872
  %876 = and i32 %875, %873
  %877 = and i32 %868, 1
  %878 = shl i32 %876, 3
  %879 = load i8* %column, align 1
  %880 = zext i8 %879 to i32
  %881 = and i32 %880, %878
  %882 = xor i32 %880, %878
  %883 = or i32 %881, %882
  %884 = or i32 %880, %878
  %885 = trunc i32 %883 to i8
  store i8 %885, i8* %column, align 1
  %886 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %887 = load i8* %886, align 1
  %888 = zext i8 %887 to i32
  %889 = xor i32 1733399228, -1
  %890 = or i32 %888, 1733399228
  %891 = or i32 224, 1733399228
  %892 = or i32 %888, %889
  %893 = or i32 224, %889
  %894 = and i32 %890, %891
  %895 = and i32 %894, %892
  %896 = and i32 %895, %893
  %897 = and i32 %888, 224
  %898 = ashr i32 %896, 5
  %899 = load i8* %column, align 1
  %900 = zext i8 %899 to i32
  %901 = xor i32 %900, -1
  %902 = xor i32 %898, -1
  %903 = xor i32 1947719566, -1
  %904 = and i32 %901, 1947719566
  %905 = and i32 %900, %903
  %906 = and i32 %902, 1947719566
  %907 = and i32 %898, %903
  %908 = or i32 %904, %905
  %909 = or i32 %906, %907
  %910 = xor i32 %908, %909
  %911 = or i32 %901, %902
  %912 = xor i32 %911, -1
  %913 = or i32 1947719566, %903
  %914 = and i32 %912, %913
  %915 = or i32 %910, %914
  %916 = or i32 %900, %898
  %917 = trunc i32 %915 to i8
  store i8 %917, i8* %column, align 1
  %918 = load i8* %row, align 1
  %919 = zext i8 %918 to i32
  %920 = mul nsw i32 %919, 16
  %921 = load i8* %column, align 1
  %922 = zext i8 %921 to i32
  %923 = xor i32 %920, %922
  %924 = and i32 %920, %922
  %925 = add i32 %924, %924
  %926 = add nsw i32 %923, %925
  %927 = add nsw i32 %920, %922
  %928 = sext i32 %926 to i64
  %929 = getelementptr inbounds [64 x i32]* @S6, i32 0, i64 %928
  %930 = load i32* %929, align 4
  %931 = trunc i32 %930 to i8
  %932 = zext i8 %931 to i32
  %933 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 2
  %934 = load i8* %933, align 1
  %935 = zext i8 %934 to i32
  %936 = and i32 %935, %932
  %937 = xor i32 %935, %932
  %938 = or i32 %936, %937
  %939 = or i32 %935, %932
  %940 = trunc i32 %938 to i8
  store i8 %940, i8* %933, align 1
  store i8 0, i8* %row, align 1
  %941 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %942 = load i8* %941, align 1
  %943 = zext i8 %942 to i32
  %944 = xor i32 1761749030, -1
  %945 = or i32 %943, 1761749030
  %946 = or i32 8, 1761749030
  %947 = or i32 %943, %944
  %948 = or i32 8, %944
  %949 = and i32 %945, %946
  %950 = and i32 %949, %947
  %951 = and i32 %950, %948
  %952 = and i32 %943, 8
  %953 = ashr i32 %951, 2
  %954 = load i8* %row, align 1
  %955 = zext i8 %954 to i32
  %956 = xor i32 %955, -1
  %957 = xor i32 %953, -1
  %958 = xor i32 1500813913, -1
  %959 = and i32 %956, 1500813913
  %960 = and i32 %955, %958
  %961 = and i32 %957, 1500813913
  %962 = and i32 %953, %958
  %963 = or i32 %959, %960
  %964 = or i32 %961, %962
  %965 = xor i32 %963, %964
  %966 = or i32 %956, %957
  %967 = xor i32 %966, -1
  %968 = or i32 1500813913, %958
  %969 = and i32 %967, %968
  %970 = or i32 %965, %969
  %971 = or i32 %955, %953
  %972 = trunc i32 %970 to i8
  store i8 %972, i8* %row, align 1
  %973 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %974 = load i8* %973, align 1
  %975 = zext i8 %974 to i32
  %976 = xor i32 -1272266004, -1
  %977 = or i32 %975, -1272266004
  %978 = or i32 64, -1272266004
  %979 = or i32 %975, %976
  %980 = or i32 64, %976
  %981 = and i32 %977, %978
  %982 = and i32 %981, %979
  %983 = and i32 %982, %980
  %984 = and i32 %975, 64
  %985 = ashr i32 %983, 6
  %986 = load i8* %row, align 1
  %987 = zext i8 %986 to i32
  %988 = xor i32 %987, -1
  %989 = xor i32 %985, -1
  %990 = xor i32 1294212987, -1
  %991 = and i32 %988, 1294212987
  %992 = and i32 %987, %990
  %993 = and i32 %989, 1294212987
  %994 = and i32 %985, %990
  %995 = or i32 %991, %992
  %996 = or i32 %993, %994
  %997 = xor i32 %995, %996
  %998 = or i32 %988, %989
  %999 = xor i32 %998, -1
  %1000 = or i32 1294212987, %990
  %1001 = and i32 %999, %1000
  %1002 = or i32 %997, %1001
  %1003 = or i32 %987, %985
  %1004 = trunc i32 %1002 to i8
  store i8 %1004, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %1005 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 4
  %1006 = load i8* %1005, align 1
  %1007 = zext i8 %1006 to i32
  %1008 = xor i32 1851927311, -1
  %1009 = or i32 %1007, 1851927311
  %1010 = or i32 7, 1851927311
  %1011 = or i32 %1007, %1008
  %1012 = or i32 7, %1008
  %1013 = and i32 %1009, %1010
  %1014 = and i32 %1013, %1011
  %1015 = and i32 %1014, %1012
  %1016 = and i32 %1007, 7
  %1017 = shl i32 %1015, 1
  %1018 = load i8* %column, align 1
  %1019 = zext i8 %1018 to i32
  %1020 = xor i32 %1019, -1
  %1021 = xor i32 %1017, -1
  %1022 = xor i32 -1429563080, -1
  %1023 = and i32 %1020, -1429563080
  %1024 = and i32 %1019, %1022
  %1025 = and i32 %1021, -1429563080
  %1026 = and i32 %1017, %1022
  %1027 = or i32 %1023, %1024
  %1028 = or i32 %1025, %1026
  %1029 = xor i32 %1027, %1028
  %1030 = or i32 %1020, %1021
  %1031 = xor i32 %1030, -1
  %1032 = or i32 -1429563080, %1022
  %1033 = and i32 %1031, %1032
  %1034 = or i32 %1029, %1033
  %1035 = or i32 %1019, %1017
  %1036 = trunc i32 %1034 to i8
  store i8 %1036, i8* %column, align 1
  %1037 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1038 = load i8* %1037, align 1
  %1039 = zext i8 %1038 to i32
  %1040 = xor i32 2125685951, -1
  %1041 = or i32 %1039, 2125685951
  %1042 = or i32 128, 2125685951
  %1043 = or i32 %1039, %1040
  %1044 = or i32 128, %1040
  %1045 = and i32 %1041, %1042
  %1046 = and i32 %1045, %1043
  %1047 = and i32 %1046, %1044
  %1048 = and i32 %1039, 128
  %1049 = ashr i32 %1047, 7
  %1050 = load i8* %column, align 1
  %1051 = zext i8 %1050 to i32
  %1052 = xor i32 %1051, -1
  %1053 = xor i32 %1049, -1
  %1054 = xor i32 -1764832339, -1
  %1055 = and i32 %1052, -1764832339
  %1056 = and i32 %1051, %1054
  %1057 = and i32 %1053, -1764832339
  %1058 = and i32 %1049, %1054
  %1059 = or i32 %1055, %1056
  %1060 = or i32 %1057, %1058
  %1061 = xor i32 %1059, %1060
  %1062 = or i32 %1052, %1053
  %1063 = xor i32 %1062, -1
  %1064 = or i32 -1764832339, %1054
  %1065 = and i32 %1063, %1064
  %1066 = or i32 %1061, %1065
  %1067 = or i32 %1051, %1049
  %1068 = trunc i32 %1066 to i8
  store i8 %1068, i8* %column, align 1
  %1069 = load i8* %row, align 1
  %1070 = zext i8 %1069 to i32
  %1071 = mul nsw i32 %1070, 16
  %1072 = load i8* %column, align 1
  %1073 = zext i8 %1072 to i32
  %1074 = xor i32 %1071, %1073
  %1075 = and i32 %1071, %1073
  %1076 = add i32 %1075, %1075
  %1077 = add nsw i32 %1074, %1076
  %1078 = add nsw i32 %1071, %1073
  %1079 = sext i32 %1077 to i64
  %1080 = getelementptr inbounds [64 x i32]* @S7, i32 0, i64 %1079
  %1081 = load i32* %1080, align 4
  %1082 = trunc i32 %1081 to i8
  %1083 = zext i8 %1082 to i32
  %1084 = shl i32 %1083, 4
  %1085 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 3
  %1086 = load i8* %1085, align 1
  %1087 = zext i8 %1086 to i32
  %1088 = and i32 %1087, %1084
  %1089 = xor i32 %1087, %1084
  %1090 = or i32 %1088, %1089
  %1091 = or i32 %1087, %1084
  %1092 = trunc i32 %1090 to i8
  store i8 %1092, i8* %1085, align 1
  store i8 0, i8* %row, align 1
  %1093 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1094 = load i8* %1093, align 1
  %1095 = zext i8 %1094 to i32
  %1096 = xor i32 1873955936, -1
  %1097 = or i32 %1095, 1873955936
  %1098 = or i32 32, 1873955936
  %1099 = or i32 %1095, %1096
  %1100 = or i32 32, %1096
  %1101 = and i32 %1097, %1098
  %1102 = and i32 %1101, %1099
  %1103 = and i32 %1102, %1100
  %1104 = and i32 %1095, 32
  %1105 = ashr i32 %1103, 4
  %1106 = load i8* %row, align 1
  %1107 = zext i8 %1106 to i32
  %1108 = and i32 %1107, %1105
  %1109 = xor i32 %1107, %1105
  %1110 = or i32 %1108, %1109
  %1111 = or i32 %1107, %1105
  %1112 = trunc i32 %1110 to i8
  store i8 %1112, i8* %row, align 1
  %1113 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1114 = load i8* %1113, align 1
  %1115 = zext i8 %1114 to i32
  %1116 = xor i32 -1971574965, -1
  %1117 = or i32 %1115, -1971574965
  %1118 = or i32 1, -1971574965
  %1119 = or i32 %1115, %1116
  %1120 = or i32 1, %1116
  %1121 = and i32 %1117, %1118
  %1122 = and i32 %1121, %1119
  %1123 = and i32 %1122, %1120
  %1124 = and i32 %1115, 1
  %1125 = load i8* %row, align 1
  %1126 = zext i8 %1125 to i32
  %1127 = xor i32 %1126, -1
  %1128 = xor i32 %1123, -1
  %1129 = xor i32 -453092860, -1
  %1130 = and i32 %1127, -453092860
  %1131 = and i32 %1126, %1129
  %1132 = and i32 %1128, -453092860
  %1133 = and i32 %1123, %1129
  %1134 = or i32 %1130, %1131
  %1135 = or i32 %1132, %1133
  %1136 = xor i32 %1134, %1135
  %1137 = or i32 %1127, %1128
  %1138 = xor i32 %1137, -1
  %1139 = or i32 -453092860, %1129
  %1140 = and i32 %1138, %1139
  %1141 = or i32 %1136, %1140
  %1142 = or i32 %1126, %1123
  %1143 = trunc i32 %1141 to i8
  store i8 %1143, i8* %row, align 1
  store i8 0, i8* %column, align 1
  %1144 = getelementptr inbounds [6 x i8]* %er, i32 0, i64 5
  %1145 = load i8* %1144, align 1
  %1146 = zext i8 %1145 to i32
  %1147 = xor i32 -1155320283, -1
  %1148 = or i32 %1146, -1155320283
  %1149 = or i32 30, -1155320283
  %1150 = or i32 %1146, %1147
  %1151 = or i32 30, %1147
  %1152 = and i32 %1148, %1149
  %1153 = and i32 %1152, %1150
  %1154 = and i32 %1153, %1151
  %1155 = and i32 %1146, 30
  %1156 = ashr i32 %1154, 1
  %1157 = load i8* %column, align 1
  %1158 = zext i8 %1157 to i32
  %1159 = xor i32 %1158, -1
  %1160 = xor i32 %1156, -1
  %1161 = xor i32 700910785, -1
  %1162 = and i32 %1159, 700910785
  %1163 = and i32 %1158, %1161
  %1164 = and i32 %1160, 700910785
  %1165 = and i32 %1156, %1161
  %1166 = or i32 %1162, %1163
  %1167 = or i32 %1164, %1165
  %1168 = xor i32 %1166, %1167
  %1169 = or i32 %1159, %1160
  %1170 = xor i32 %1169, -1
  %1171 = or i32 700910785, %1161
  %1172 = and i32 %1170, %1171
  %1173 = or i32 %1168, %1172
  %1174 = or i32 %1158, %1156
  %1175 = trunc i32 %1173 to i8
  store i8 %1175, i8* %column, align 1
  %1176 = load i8* %row, align 1
  %1177 = zext i8 %1176 to i32
  %1178 = mul nsw i32 %1177, 16
  %1179 = load i8* %column, align 1
  %1180 = zext i8 %1179 to i32
  %1181 = xor i32 %1178, %1180
  %1182 = and i32 %1178, %1180
  %1183 = add i32 %1182, %1182
  %1184 = add nsw i32 %1181, %1183
  %1185 = add nsw i32 %1178, %1180
  %1186 = sext i32 %1184 to i64
  %1187 = getelementptr inbounds [64 x i32]* @S8, i32 0, i64 %1186
  %1188 = load i32* %1187, align 4
  %1189 = trunc i32 %1188 to i8
  %1190 = zext i8 %1189 to i32
  %1191 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 3
  %1192 = load i8* %1191, align 1
  %1193 = zext i8 %1192 to i32
  %1194 = xor i32 %1193, -1
  %1195 = xor i32 %1190, -1
  %1196 = xor i32 -1892762173, -1
  %1197 = and i32 %1194, -1892762173
  %1198 = and i32 %1193, %1196
  %1199 = and i32 %1195, -1892762173
  %1200 = and i32 %1190, %1196
  %1201 = or i32 %1197, %1198
  %1202 = or i32 %1199, %1200
  %1203 = xor i32 %1201, %1202
  %1204 = or i32 %1194, %1195
  %1205 = xor i32 %1204, -1
  %1206 = or i32 -1892762173, %1196
  %1207 = and i32 %1205, %1206
  %1208 = or i32 %1203, %1207
  %1209 = or i32 %1193, %1190
  %1210 = trunc i32 %1208 to i8
  store i8 %1210, i8* %1191, align 1
  store i32 0, i32* %i, align 4
  br label %1211

; <label>:1211                                    ; preds = %1218, %262
  %1212 = load i32* %i, align 4
  %1213 = icmp slt i32 %1212, 4
  br i1 %1213, label %1214, label %1225

; <label>:1214                                    ; preds = %1211
  %1215 = load i32* %i, align 4
  %1216 = sext i32 %1215 to i64
  %1217 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1216
  store i8 0, i8* %1217, align 1
  br label %1218

; <label>:1218                                    ; preds = %1214
  %1219 = load i32* %i, align 4
  %1220 = xor i32 %1219, 1
  %1221 = and i32 %1219, 1
  %1222 = add i32 %1221, %1221
  %1223 = add nsw i32 %1220, %1222
  %1224 = add nsw i32 %1219, 1
  store i32 %1223, i32* %i, align 4
  br label %1211

; <label>:1225                                    ; preds = %1211
  store i32 0, i32* %i, align 4
  br label %1226

; <label>:1226                                    ; preds = %1308, %1225
  %1227 = load i32* %i, align 4
  %1228 = icmp slt i32 %1227, 32
  br i1 %1228, label %1229, label %1315

; <label>:1229                                    ; preds = %1226
  %1230 = load i32* %i, align 4
  %1231 = sext i32 %1230 to i64
  %1232 = getelementptr inbounds [32 x i32]* @right_sub_message_permutation, i32 0, i64 %1231
  %1233 = load i32* %1232, align 4
  store i32 %1233, i32* %shift_size, align 4
  %1234 = load i32* %shift_size, align 4
  %1235 = sub i32 0, 1
  %1236 = xor i32 %1234, %1235
  %1237 = and i32 %1234, %1235
  %1238 = add i32 %1237, %1237
  %1239 = add nsw i32 %1236, %1238
  %1240 = sub nsw i32 %1234, 1
  %1241 = srem i32 %1239, 8
  %1242 = ashr i32 128, %1241
  %1243 = trunc i32 %1242 to i8
  store i8 %1243, i8* %shift_byte, align 1
  %1244 = load i32* %shift_size, align 4
  %1245 = sub i32 0, 1
  %1246 = xor i32 %1244, %1245
  %1247 = and i32 %1244, %1245
  %1248 = add i32 %1247, %1247
  %1249 = add nsw i32 %1246, %1248
  %1250 = sub nsw i32 %1244, 1
  %1251 = sdiv i32 %1249, 8
  %1252 = sext i32 %1251 to i64
  %1253 = getelementptr inbounds [4 x i8]* %ser, i32 0, i64 %1252
  %1254 = load i8* %1253, align 1
  %1255 = zext i8 %1254 to i32
  %1256 = load i8* %shift_byte, align 1
  %1257 = zext i8 %1256 to i32
  %1258 = xor i32 46617620, -1
  %1259 = or i32 %1257, 46617620
  %1260 = or i32 %1255, 46617620
  %1261 = or i32 %1257, %1258
  %1262 = or i32 %1255, %1258
  %1263 = and i32 %1259, %1260
  %1264 = and i32 %1263, %1261
  %1265 = and i32 %1264, %1262
  %1266 = and i32 %1257, %1255
  %1267 = trunc i32 %1265 to i8
  store i8 %1267, i8* %shift_byte, align 1
  %1268 = load i32* %shift_size, align 4
  %1269 = sub i32 0, 1
  %1270 = xor i32 %1268, %1269
  %1271 = and i32 %1268, %1269
  %1272 = add i32 %1271, %1271
  %1273 = add nsw i32 %1270, %1272
  %1274 = sub nsw i32 %1268, 1
  %1275 = srem i32 %1273, 8
  %1276 = load i8* %shift_byte, align 1
  %1277 = zext i8 %1276 to i32
  %1278 = shl i32 %1277, %1275
  %1279 = trunc i32 %1278 to i8
  store i8 %1279, i8* %shift_byte, align 1
  %1280 = load i8* %shift_byte, align 1
  %1281 = zext i8 %1280 to i32
  %1282 = load i32* %i, align 4
  %1283 = srem i32 %1282, 8
  %1284 = ashr i32 %1281, %1283
  %1285 = load i32* %i, align 4
  %1286 = sdiv i32 %1285, 8
  %1287 = sext i32 %1286 to i64
  %1288 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1287
  %1289 = load i8* %1288, align 1
  %1290 = zext i8 %1289 to i32
  %1291 = xor i32 %1290, -1
  %1292 = xor i32 %1284, -1
  %1293 = xor i32 -1695888108, -1
  %1294 = and i32 %1291, -1695888108
  %1295 = and i32 %1290, %1293
  %1296 = and i32 %1292, -1695888108
  %1297 = and i32 %1284, %1293
  %1298 = or i32 %1294, %1295
  %1299 = or i32 %1296, %1297
  %1300 = xor i32 %1298, %1299
  %1301 = or i32 %1291, %1292
  %1302 = xor i32 %1301, -1
  %1303 = or i32 -1695888108, %1293
  %1304 = and i32 %1302, %1303
  %1305 = or i32 %1300, %1304
  %1306 = or i32 %1290, %1284
  %1307 = trunc i32 %1305 to i8
  store i8 %1307, i8* %1288, align 1
  br label %1308

; <label>:1308                                    ; preds = %1229
  %1309 = load i32* %i, align 4
  %1310 = xor i32 %1309, 1
  %1311 = and i32 %1309, 1
  %1312 = add i32 %1311, %1311
  %1313 = add nsw i32 %1310, %1312
  %1314 = add nsw i32 %1309, 1
  store i32 %1313, i32* %i, align 4
  br label %1226

; <label>:1315                                    ; preds = %1226
  store i32 0, i32* %i, align 4
  br label %1316

; <label>:1316                                    ; preds = %1336, %1315
  %1317 = load i32* %i, align 4
  %1318 = icmp slt i32 %1317, 4
  br i1 %1318, label %1319, label %1343

; <label>:1319                                    ; preds = %1316
  %1320 = load i32* %i, align 4
  %1321 = sext i32 %1320 to i64
  %1322 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %1321
  %1323 = load i8* %1322, align 1
  %1324 = zext i8 %1323 to i32
  %1325 = load i32* %i, align 4
  %1326 = sext i32 %1325 to i64
  %1327 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1326
  %1328 = load i8* %1327, align 1
  %1329 = zext i8 %1328 to i32
  %1330 = and i32 %1329, %1324
  %1331 = add i32 %1330, %1330
  %1332 = add i32 %1329, %1324
  %1333 = sub i32 %1332, %1331
  %1334 = xor i32 %1329, %1324
  %1335 = trunc i32 %1333 to i8
  store i8 %1335, i8* %1327, align 1
  br label %1336

; <label>:1336                                    ; preds = %1319
  %1337 = load i32* %i, align 4
  %1338 = xor i32 %1337, 1
  %1339 = and i32 %1337, 1
  %1340 = add i32 %1339, %1339
  %1341 = add nsw i32 %1338, %1340
  %1342 = add nsw i32 %1337, 1
  store i32 %1341, i32* %i, align 4
  br label %1316

; <label>:1343                                    ; preds = %1316
  store i32 0, i32* %i, align 4
  br label %1344

; <label>:1344                                    ; preds = %1362, %1343
  %1345 = load i32* %i, align 4
  %1346 = icmp slt i32 %1345, 4
  br i1 %1346, label %1347, label %1369

; <label>:1347                                    ; preds = %1344
  %1348 = load i32* %i, align 4
  %1349 = sext i32 %1348 to i64
  %1350 = getelementptr inbounds [4 x i8]* %ln, i32 0, i64 %1349
  %1351 = load i8* %1350, align 1
  %1352 = load i32* %i, align 4
  %1353 = sext i32 %1352 to i64
  %1354 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %1353
  store i8 %1351, i8* %1354, align 1
  %1355 = load i32* %i, align 4
  %1356 = sext i32 %1355 to i64
  %1357 = getelementptr inbounds [4 x i8]* %rn, i32 0, i64 %1356
  %1358 = load i8* %1357, align 1
  %1359 = load i32* %i, align 4
  %1360 = sext i32 %1359 to i64
  %1361 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %1360
  store i8 %1358, i8* %1361, align 1
  br label %1362

; <label>:1362                                    ; preds = %1347
  %1363 = load i32* %i, align 4
  %1364 = xor i32 %1363, 1
  %1365 = and i32 %1363, 1
  %1366 = add i32 %1365, %1365
  %1367 = add nsw i32 %1364, %1366
  %1368 = add nsw i32 %1363, 1
  store i32 %1367, i32* %i, align 4
  br label %1344

; <label>:1369                                    ; preds = %1344
  br label %1370

; <label>:1370                                    ; preds = %1369
  %1371 = load i32* %k, align 4
  %1372 = xor i32 %1371, 1
  %1373 = and i32 %1371, 1
  %1374 = add i32 %1373, %1373
  %1375 = add nsw i32 %1372, %1374
  %1376 = add nsw i32 %1371, 1
  store i32 %1375, i32* %k, align 4
  br label %117

; <label>:1377                                    ; preds = %117
  store i32 0, i32* %i, align 4
  br label %1378

; <label>:1378                                    ; preds = %1401, %1377
  %1379 = load i32* %i, align 4
  %1380 = icmp slt i32 %1379, 4
  br i1 %1380, label %1381, label %1408

; <label>:1381                                    ; preds = %1378
  %1382 = load i32* %i, align 4
  %1383 = sext i32 %1382 to i64
  %1384 = getelementptr inbounds [4 x i8]* %r, i32 0, i64 %1383
  %1385 = load i8* %1384, align 1
  %1386 = load i32* %i, align 4
  %1387 = sext i32 %1386 to i64
  %1388 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %1387
  store i8 %1385, i8* %1388, align 1
  %1389 = load i32* %i, align 4
  %1390 = sext i32 %1389 to i64
  %1391 = getelementptr inbounds [4 x i8]* %l, i32 0, i64 %1390
  %1392 = load i8* %1391, align 1
  %1393 = load i32* %i, align 4
  %1394 = xor i32 4, %1393
  %1395 = and i32 4, %1393
  %1396 = add i32 %1395, %1395
  %1397 = add nsw i32 %1394, %1396
  %1398 = add nsw i32 4, %1393
  %1399 = sext i32 %1397 to i64
  %1400 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %1399
  store i8 %1392, i8* %1400, align 1
  br label %1401

; <label>:1401                                    ; preds = %1381
  %1402 = load i32* %i, align 4
  %1403 = xor i32 %1402, 1
  %1404 = and i32 %1402, 1
  %1405 = add i32 %1404, %1404
  %1406 = add nsw i32 %1403, %1405
  %1407 = add nsw i32 %1402, 1
  store i32 %1406, i32* %i, align 4
  br label %1378

; <label>:1408                                    ; preds = %1378
  store i32 0, i32* %i, align 4
  br label %1409

; <label>:1409                                    ; preds = %1492, %1408
  %1410 = load i32* %i, align 4
  %1411 = icmp slt i32 %1410, 64
  br i1 %1411, label %1412, label %1499

; <label>:1412                                    ; preds = %1409
  %1413 = load i32* %i, align 4
  %1414 = sext i32 %1413 to i64
  %1415 = getelementptr inbounds [64 x i32]* @final_message_permutation, i32 0, i64 %1414
  %1416 = load i32* %1415, align 4
  store i32 %1416, i32* %shift_size, align 4
  %1417 = load i32* %shift_size, align 4
  %1418 = sub i32 0, 1
  %1419 = xor i32 %1417, %1418
  %1420 = and i32 %1417, %1418
  %1421 = add i32 %1420, %1420
  %1422 = add nsw i32 %1419, %1421
  %1423 = sub nsw i32 %1417, 1
  %1424 = srem i32 %1422, 8
  %1425 = ashr i32 128, %1424
  %1426 = trunc i32 %1425 to i8
  store i8 %1426, i8* %shift_byte, align 1
  %1427 = load i32* %shift_size, align 4
  %1428 = sub i32 0, 1
  %1429 = xor i32 %1427, %1428
  %1430 = and i32 %1427, %1428
  %1431 = add i32 %1430, %1430
  %1432 = add nsw i32 %1429, %1431
  %1433 = sub nsw i32 %1427, 1
  %1434 = sdiv i32 %1432, 8
  %1435 = sext i32 %1434 to i64
  %1436 = getelementptr inbounds [8 x i8]* %pre_end_permutation, i32 0, i64 %1435
  %1437 = load i8* %1436, align 1
  %1438 = zext i8 %1437 to i32
  %1439 = load i8* %shift_byte, align 1
  %1440 = zext i8 %1439 to i32
  %1441 = xor i32 2136190851, -1
  %1442 = or i32 %1440, 2136190851
  %1443 = or i32 %1438, 2136190851
  %1444 = or i32 %1440, %1441
  %1445 = or i32 %1438, %1441
  %1446 = and i32 %1442, %1443
  %1447 = and i32 %1446, %1444
  %1448 = and i32 %1447, %1445
  %1449 = and i32 %1440, %1438
  %1450 = trunc i32 %1448 to i8
  store i8 %1450, i8* %shift_byte, align 1
  %1451 = load i32* %shift_size, align 4
  %1452 = sub i32 0, 1
  %1453 = xor i32 %1451, %1452
  %1454 = and i32 %1451, %1452
  %1455 = add i32 %1454, %1454
  %1456 = add nsw i32 %1453, %1455
  %1457 = sub nsw i32 %1451, 1
  %1458 = srem i32 %1456, 8
  %1459 = load i8* %shift_byte, align 1
  %1460 = zext i8 %1459 to i32
  %1461 = shl i32 %1460, %1458
  %1462 = trunc i32 %1461 to i8
  store i8 %1462, i8* %shift_byte, align 1
  %1463 = load i8* %shift_byte, align 1
  %1464 = zext i8 %1463 to i32
  %1465 = load i32* %i, align 4
  %1466 = srem i32 %1465, 8
  %1467 = ashr i32 %1464, %1466
  %1468 = load i32* %i, align 4
  %1469 = sdiv i32 %1468, 8
  %1470 = sext i32 %1469 to i64
  %1471 = load i8** %2, align 8
  %1472 = getelementptr inbounds i8* %1471, i64 %1470
  %1473 = load i8* %1472, align 1
  %1474 = zext i8 %1473 to i32
  %1475 = xor i32 %1474, -1
  %1476 = xor i32 %1467, -1
  %1477 = xor i32 78130582, -1
  %1478 = and i32 %1475, 78130582
  %1479 = and i32 %1474, %1477
  %1480 = and i32 %1476, 78130582
  %1481 = and i32 %1467, %1477
  %1482 = or i32 %1478, %1479
  %1483 = or i32 %1480, %1481
  %1484 = xor i32 %1482, %1483
  %1485 = or i32 %1475, %1476
  %1486 = xor i32 %1485, -1
  %1487 = or i32 78130582, %1477
  %1488 = and i32 %1486, %1487
  %1489 = or i32 %1484, %1488
  %1490 = or i32 %1474, %1467
  %1491 = trunc i32 %1489 to i8
  store i8 %1491, i8* %1472, align 1
  br label %1492

; <label>:1492                                    ; preds = %1412
  %1493 = load i32* %i, align 4
  %1494 = xor i32 %1493, 1
  %1495 = and i32 %1493, 1
  %1496 = add i32 %1495, %1495
  %1497 = add nsw i32 %1494, %1496
  %1498 = add nsw i32 %1493, 1
  store i32 %1497, i32* %i, align 4
  br label %1409

; <label>:1499                                    ; preds = %1409
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Obfuscator-LLVM clang version 3.6.1 (tags/RELEASE_361/final) (based on Obfuscator-LLVM 3.6.1)"}
