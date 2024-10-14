-- CreateTable
CREATE TABLE "ORIGIN_SCHEMETYPE" (
    "id" SERIAL NOT NULL,
    "SchemeType" TEXT,
    "SchemeMode" TEXT,

    CONSTRAINT "ORIGIN_SCHEMETYPE_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ORIGIN_SCHEME_NAME" (
    "id" SERIAL NOT NULL,
    "SchemeCode" TEXT NOT NULL,
    "SchemeType" TEXT,
    "SchemeName" TEXT,
    "SchemeAmount" DOUBLE PRECISION,
    "SchemeDuration" DOUBLE PRECISION,
    "SchemePersons" DOUBLE PRECISION,
    "BonusMonth" DOUBLE PRECISION,
    "BonusAmount" DOUBLE PRECISION,
    "SchemeValue" DOUBLE PRECISION,
    "Commper" DOUBLE PRECISION,
    "Commamt" DOUBLE PRECISION,
    "Continuous" BOOLEAN,

    CONSTRAINT "ORIGIN_SCHEME_NAME_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ORIGIN_SCHEME_USER" (
    "id" SERIAL NOT NULL,
    "SchemeType" TEXT,
    "SchemeName" TEXT,
    "SchemeCode" TEXT,
    "MemberName" TEXT,
    "CardNo" TEXT NOT NULL,
    "Gender" TEXT,
    "City" TEXT,
    "Address" TEXT,
    "Pincode" DOUBLE PRECISION,
    "State" TEXT,
    "District" TEXT,
    "LandLine" TEXT,
    "Mobile1" TEXT,
    "Mobile2" TEXT,
    "Email" TEXT,
    "Dob" TEXT,
    "Anniversary" TEXT,
    "Nominee" TEXT,
    "MobileNo" TEXT,
    "Incharge" TEXT,
    "JoinDate" TEXT,
    "CollectionPoint" TEXT,
    "LastDatePaid" TEXT,
    "ActualDateToPay" TEXT,
    "NextDateToPay" TEXT,

    CONSTRAINT "ORIGIN_SCHEME_USER_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ORIGIN_SCHEME_USER_CARD" (
    "id" SERIAL NOT NULL,
    "CardNo" TEXT NOT NULL,
    "Month" TIMESTAMP(3),
    "RecNo" TEXT,
    "RecDate" TIMESTAMP(3),
    "RecAmt" DOUBLE PRECISION,
    "GoldWt" DOUBLE PRECISION,
    "GoldAmt" DOUBLE PRECISION,
    "ModeOfPay" TEXT,
    "Balance" DOUBLE PRECISION,

    CONSTRAINT "ORIGIN_SCHEME_USER_CARD_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ORIGIN_SCHEME_USER_SETTLEMENT" (
    "id" SERIAL NOT NULL,
    "SchemeType" TEXT,
    "SchemeName" TEXT,
    "CardNo" TEXT NOT NULL,
    "MemberName" TEXT,
    "MobileNo" TEXT,
    "SchemeAmount" DOUBLE PRECISION,
    "PaidAmount" DOUBLE PRECISION,
    "BalanceAmount" DOUBLE PRECISION,
    "GoldWt" DOUBLE PRECISION,
    "GoldAmt" DOUBLE PRECISION,
    "Settled" BOOLEAN,
    "Discontinue" BOOLEAN,
    "Description" TEXT,
    "Date" TEXT,
    "VoucherNo" TEXT,

    CONSTRAINT "ORIGIN_SCHEME_USER_SETTLEMENT_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ORIGIN_SCHEME_RECEIPT" (
    "id" SERIAL NOT NULL,
    "ReceiptNo" TEXT NOT NULL,
    "ReceiptDate" TEXT,
    "CardNo" TEXT,
    "SchemeType" TEXT,
    "SchemeName" TEXT,
    "SchemeCode" TEXT,
    "MobileNo" TEXT,
    "MemberName" TEXT,
    "Address" TEXT,
    "CollectionPoint" BOOLEAN,
    "CashDesc" TEXT,
    "CashAmount" INTEGER,
    "CardDesc" TEXT,
    "CardAmount" INTEGER,
    "OnlineParticulars" TEXT,
    "OnlineAcc" TEXT,
    "OnlineDesc" TEXT,
    "OnlineAmount" INTEGER,
    "UPIParticulars" TEXT,
    "UPIAcc" TEXT,
    "UPIDesc" TEXT,
    "UPIAmount" INTEGER,
    "Description" TEXT,
    "Amount" INTEGER NOT NULL,
    "GoldWt" DOUBLE PRECISION,
    "GoldAmount" DOUBLE PRECISION,
    "Incharge" TEXT,

    CONSTRAINT "ORIGIN_SCHEME_RECEIPT_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LOGIN_USER" (
    "id" SERIAL NOT NULL,
    "UserName" TEXT NOT NULL,
    "Password" TEXT NOT NULL,

    CONSTRAINT "LOGIN_USER_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ONLINEMODE_MAST" (
    "id" SERIAL NOT NULL,
    "PMODE" TEXT,
    "PAYMODE" TEXT,
    "ACCNO" TEXT,
    "ACCNAME" TEXT,

    CONSTRAINT "ONLINEMODE_MAST_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MOBILE_LOGIN" (
    "id" SERIAL NOT NULL,
    "MemberName" TEXT,
    "Gender" TEXT,
    "City" TEXT,
    "Address" TEXT,
    "Pincode" DOUBLE PRECISION,
    "State" TEXT,
    "District" TEXT,
    "MobileNo" TEXT,
    "Password" TEXT,
    "Email" TEXT,
    "Dob" TEXT,
    "Anniversary" TEXT,

    CONSTRAINT "MOBILE_LOGIN_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FEEDBACK" (
    "id" SERIAL NOT NULL,
    "MemberName" TEXT,
    "Email" TEXT,
    "MobileNo" TEXT,
    "Category" TEXT,
    "Feedback" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "FEEDBACK_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ORIGIN_SCHEMETYPE_SchemeType_key" ON "ORIGIN_SCHEMETYPE"("SchemeType");

-- CreateIndex
CREATE UNIQUE INDEX "ORIGIN_SCHEME_NAME_SchemeCode_key" ON "ORIGIN_SCHEME_NAME"("SchemeCode");

-- CreateIndex
CREATE UNIQUE INDEX "ORIGIN_SCHEME_NAME_SchemeName_key" ON "ORIGIN_SCHEME_NAME"("SchemeName");

-- CreateIndex
CREATE UNIQUE INDEX "ORIGIN_SCHEME_USER_CardNo_key" ON "ORIGIN_SCHEME_USER"("CardNo");

-- CreateIndex
CREATE UNIQUE INDEX "ORIGIN_SCHEME_USER_CARD_CardNo_key" ON "ORIGIN_SCHEME_USER_CARD"("CardNo");

-- CreateIndex
CREATE UNIQUE INDEX "ORIGIN_SCHEME_USER_SETTLEMENT_CardNo_key" ON "ORIGIN_SCHEME_USER_SETTLEMENT"("CardNo");

-- CreateIndex
CREATE UNIQUE INDEX "ORIGIN_SCHEME_USER_SETTLEMENT_VoucherNo_key" ON "ORIGIN_SCHEME_USER_SETTLEMENT"("VoucherNo");

-- CreateIndex
CREATE UNIQUE INDEX "ORIGIN_SCHEME_RECEIPT_ReceiptNo_key" ON "ORIGIN_SCHEME_RECEIPT"("ReceiptNo");

-- CreateIndex
CREATE UNIQUE INDEX "LOGIN_USER_UserName_key" ON "LOGIN_USER"("UserName");

-- CreateIndex
CREATE UNIQUE INDEX "MOBILE_LOGIN_MobileNo_key" ON "MOBILE_LOGIN"("MobileNo");
