class KidsnamesController < ApplicationController
  # GET /kidsnames
  # GET /kidsnames.json
  def index
    @kidsnames = Kidsname.all    

    @outnames = Kidsname.where ['score <= ?', -1]
    @outnames = @outnames.where ['score > ?', -450]
    @outnames = @outnames.all.sort_by(&:count).reverse!

    @topnames = Kidsname.where ['score >= count']
    @topnames = @topnames.where ['count > ?', 5]

    @takennames = Kidsname.where ['score <= ?', -450]

    @votegirlnames = Kidsname.where ['gender = \'f\' AND score >= ?', -1]
    @votegirlnames = @votegirlnames.all.sort_by(&:score).reverse!

    @voteboynames = Kidsname.where ['gender = \'m\' AND score >= ?', -1]
    @voteboynames = @voteboynames.all.sort_by(&:score).reverse!


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kidsnames }
    



    end
  end

  # GET /kidsnames/1
  # GET /kidsnames/1.json
  def show
    @kidsname = Kidsname.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kidsname }
    end
  end

  # GET /kidsnames/new
  # GET /kidsnames/new.json
  def new
    @kidsname = Kidsname.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kidsname }
    end
  end

  # GET /kidsnames/1/edit
  def edit
    @kidsname = Kidsname.find(params[:id])
  end

  # POST /kidsnames
  # POST /kidsnames.json
  def create
    @kidsname = Kidsname.new(params[:kidsname])
    @kidsname.name = params[:kidsname][:name].capitalize
    respond_to do |format|
      if @kidsname.save
        format.html { redirect_to @kidsname, notice: 'Kidsname was successfully created.' }
        format.json { render json: @kidsname, status: :created, location: @kidsname }
        @kidsname.count = 0
        @kidsname.score = 0
        @kidsname.save

      else
        format.html { render action: "new" }
        format.json { render json: @kidsname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kidsnames/1
  # PUT /kidsnames/1.json
  def update
    @kidsname = Kidsname.find(params[:id])

    respond_to do |format|
      if @kidsname.update_attributes(params[:kidsname])
        format.html { redirect_to @kidsname, notice: 'Kidsname was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kidsname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kidsnames/1
  # DELETE /kidsnames/1.json
  def destroy
    @kidsname = Kidsname.find(params[:id])
    @kidsname.destroy

    respond_to do |format|
      format.html { redirect_to kidsnames_url }
      format.json { head :no_content }
    end
  end


  def vote
    @votenames = @votenames.shuffle  

    @votenames[0].count +=1
        @votenames[0].save

    @votenames[1].count +=1 
        @votenames[1].save 
  end

  def voteboys
    @votenames = Kidsname.where ['gender = \'m\' AND score >= ?', -99 ]
    vote
  end

  def votegirls
    @votenames = Kidsname.where ['gender = \'f\' AND score >= ?', -99 ]
    vote
  end


  def voteresult
    @winner = Kidsname.find_by_id(params["winner"])
    @winner.score +=1
    @winner.save
      
    @scorenames = Kidsname.where ['score >= ?', -99 ]

    @scorenames.each do |x|
      if x.count >= 5 && x.score <= 2
       x.score = -100
       x.save

     elsif x.count == 4 && x.score == 0
       x.score = -100
       x.save

     elsif x.count >= 10 && x.score <=6
      x.score = -100
      x.save 
         
     elsif x.count >= 10 && x.count == x.score
      x.score +=5
      x.save

     elsif x.count >= 15 && x.score <= 8
      x.score = -100
      x.save

     elsif x.count >= 20 && x.score <= 12
      x.score = -100
      x.save

      end
    end

  end


#Checkbox/Radio button methods to remove unwanted/taken names
  def edit_multiple

    @editnames = Kidsname.where ['score >= ?', -1]
    @editnames = @editnames.sort_by(&:name)

  end

  def update_multiple


    params[:editnames].each_pair do |k,v|
      if v == "-500"

        takenname = Kidsname.find_by_id(k)
        takenname.score = -500
        takenname.save!

      elsif v == "-100"

        dislikedname = Kidsname.find_by_id(k)
        dislikedname.score = -100
        dislikedname.save!

      end
    end

      redirect_to kidsnames_path
  end

#end
end